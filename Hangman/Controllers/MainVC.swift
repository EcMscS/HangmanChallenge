//
//  MainVC.swift
//  Hangman
//
//  Created by Jeffrey Lai on 11/27/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    let allowedNumberOfGuesses = 5
    let numberOfRows = 6
    let numberOfLettersInEachRow = 5
    
    enum GameEndState {
        case win
        case lose
    }
    
    var gameStatus: UILabel = UILabel()
    var scoreLabel: UILabel = UILabel()
    var wordLabel: UILabel = UILabel()
    let newGameButton: UIButton = UIButton(type: .system)
    let wordView: UIView = UIView()
    let lettersView: UIView = UIView()
    let scoreCardView: UIView = UIView()
    let letterColumnStackview: UIStackView = UIStackView()
    var letterRowStackviews = [UIStackView]()
    var alphabetButtons: [UIButton] = [UIButton]()
    
    var score = 0 {
        didSet {
            scoreLabel.attributedText = createAttributedText(text: "Score: \(score)", size: 50, fontWeight: .bold, isShadow: false, wordSpacing: 0)
        }
    }
    
    var currentGameWord: String = "Eagle"
    var correctWordCount: Int = 0
    var currentGuess: [String] = [String]()
    var currentWord: String = ""
    var allLetters: [Character] = []
    var usedLetters: [Character] = []
    var gameCompleted: Bool = false
    
    var scorecardTopAnchor: NSLayoutConstraint!
    var scorecardTrailingAnchor: NSLayoutConstraint!
    var scorecardBottomAnchor: NSLayoutConstraint!
    var scorecardLeadingAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupNavBar()
        setupViews()
        setupLetters()
    }
    
    func setupGame(newWord: String) {
        currentWord = newWord.uppercased()
        print("Current word is: \(currentWord)")
        
        for (_,_) in currentWord.enumerated() {
            currentGuess.append("_")
        }
        
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.textAlignment = .center
        wordLabel.attributedText = createAttributedText(text: numberOfUnderscores(), size: 50, fontWeight: .heavy, isShadow: false, wordSpacing: 10)
        
        gameCompleted = false
        emptyButtonsAndLetters()
    }
    
    func setupNavBar() {
        title = "H?ngm?n"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //Only called once
    func setupViews() {
        setupGame(newWord: currentGameWord)
        
        for _ in 0..<numberOfRows {
            let singleStackview = UIStackView()
            singleStackview.translatesAutoresizingMaskIntoConstraints = false
            singleStackview.distribution = .fillEqually
            singleStackview.axis = .horizontal
            letterRowStackviews.append(singleStackview)
        }
        
        view.backgroundColor = .systemBackground
        
        wordLabel.attributedText = createAttributedText(text: numberOfUnderscores(), size: 50, fontWeight: .heavy, isShadow: false, wordSpacing: 10)
        
        wordView.backgroundColor = .systemRed
        wordView.translatesAutoresizingMaskIntoConstraints = false
        wordView.addSubview(wordLabel)
        
        lettersView.backgroundColor = .systemBlue
        lettersView.translatesAutoresizingMaskIntoConstraints = false
        
        scoreCardView.backgroundColor = .systemYellow
        scoreCardView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(wordView)
        view.addSubview(lettersView)
        view.addSubview(scoreCardView)
        
        scorecardTopAnchor = scoreCardView.topAnchor.constraint(equalTo: view.bottomAnchor, constant:0)
        scorecardTrailingAnchor = scoreCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        scorecardBottomAnchor = scoreCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        scorecardLeadingAnchor = scoreCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        NSLayoutConstraint.activate([
            wordLabel.centerXAnchor.constraint(equalTo: wordView.centerXAnchor),
            wordLabel.centerYAnchor.constraint(equalTo: wordView.centerYAnchor),
            
            wordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            wordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            wordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            wordView.heightAnchor.constraint(equalToConstant: 150),
    
            lettersView.topAnchor.constraint(equalTo: wordView.bottomAnchor, constant: 10),
            lettersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lettersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lettersView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            scorecardTopAnchor,
            scorecardTrailingAnchor,
            scorecardBottomAnchor,
            scorecardLeadingAnchor
        ])
    }
    
    func emptyButtonsAndLetters() {
        let alphabet = "abcdefghijklmnopqrstuvwxyz".uppercased() //26 Letters
        
        allLetters = [Character]()
        
        for (position, letter) in alphabet.enumerated() {
            allLetters.append(letter)
            let newButton = UIButton(type: .system)
            newButton.tag = position
            alphabetButtons.append(newButton)
        }
    }
    
    func setupLetters() {
        //let letterColumnStackview = UIStackView()
        letterColumnStackview.translatesAutoresizingMaskIntoConstraints = false
        letterColumnStackview.distribution = .fillEqually
        letterColumnStackview.axis = .vertical
        
        var index = 0
        
        for each in 0..<letterRowStackviews.count {
            letterColumnStackview.addArrangedSubview(letterRowStackviews[each])
            for _ in 0..<numberOfLettersInEachRow {
                if !allLetters.isEmpty {
                    //let button = UIButton(type: .system)
                    let button = alphabetButtons[index]
                    let currentLetter = allLetters.removeFirst()
                    button.setAttributedTitle(createAttributedText(text: String(currentLetter), size: 30, fontWeight: .bold, isShadow: true, wordSpacing: 0), for: .normal)
                    letterRowStackviews[each].addArrangedSubview(button)
                    button.addTarget(self, action:#selector(buttonPressed(button:)), for: .touchUpInside)
                    
                    index += 1
                    //TESTING
                    print("Current Letter: \(currentLetter) and letter count: \(allLetters.count)" )
                }
            }
        }
        
        lettersView.addSubview(letterColumnStackview)
        
        NSLayoutConstraint.activate([
            letterColumnStackview.topAnchor.constraint(equalTo: lettersView.topAnchor, constant: 10),
            letterColumnStackview.trailingAnchor.constraint(equalTo: lettersView.trailingAnchor, constant: -10),
            letterColumnStackview.bottomAnchor.constraint(equalTo: lettersView.bottomAnchor, constant: -10),
            letterColumnStackview.leadingAnchor.constraint(equalTo: lettersView.leadingAnchor, constant: 10)
        ])
    }
    
    //Only to be called when game is reset
    func numberOfUnderscores() -> String {
        let number = currentWord.count
        var underscores:String = ""
    
        for _ in 0..<number {
            underscores = underscores + "_"
        }
        
        return underscores
    }
    
    func createAttributedText(text: String, size: CGFloat, fontWeight: UIFont.Weight , isShadow: Bool, wordSpacing: CGFloat) -> NSAttributedString {
        let buttonFont = UIFont.systemFont(ofSize: size, weight: fontWeight)
        var fontAttributes: [NSAttributedString.Key: Any]
        
        if isShadow {
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.black
            shadow.shadowBlurRadius = 5
            
            fontAttributes = [
                .font: buttonFont,
                .foregroundColor: UIColor.white,
                .shadow: shadow,
                .kern: wordSpacing
            ]
        } else {
            fontAttributes = [
                .font: buttonFont,
                .foregroundColor: UIColor.white,
                .kern: wordSpacing
            ]
        }
        return NSAttributedString.init(string: text, attributes: fontAttributes)
    }
    
    func revealLetter(letter: String) {
        var revealPositions = [Int]()
        
        for (position, eachLetter) in currentWord.enumerated() {
            if eachLetter == Character(letter) {
                revealPositions.append(position)
            }
        }
        
        while revealPositions.count != 0 {
            for reveal in revealPositions {
                currentGuess[reveal] = letter
                wordLabel.attributedText = createAttributedText(text: currentGuess.joined(), size: 50, fontWeight: .heavy, isShadow: false, wordSpacing: 10)
            }
            if !revealPositions.isEmpty {
                revealPositions.remove(at: 0)
                correctWordCount += 1
            }
        }
    }
    
    func setupScorecardView() {
        print("Setup scorecard views")
        scoreLabel.textAlignment = .center
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        newGameButton.setAttributedTitle(createAttributedText(text: "New Game", size: 30, fontWeight: .medium, isShadow: false, wordSpacing: 0), for: .normal)
        newGameButton.backgroundColor = .systemFill
        newGameButton.layer.cornerRadius = 10
        newGameButton.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.2)
        newGameButton.layer.borderWidth = 2
        newGameButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        newGameButton.addTarget(self, action: #selector(newGameButtonPressed(button:)), for: .touchUpInside)
        
        let scoreStackview = UIStackView()
        scoreStackview.translatesAutoresizingMaskIntoConstraints = false
        scoreStackview.axis = .vertical
        scoreStackview.alignment = .center
        scoreStackview.distribution = .fill
        scoreStackview.addArrangedSubview(scoreLabel)
        scoreStackview.addArrangedSubview(UIView())
        scoreStackview.addArrangedSubview(newGameButton)
        
        scoreCardView.addSubview(scoreStackview)

        NSLayoutConstraint.activate([
            scoreStackview.topAnchor.constraint(equalTo: scoreCardView.topAnchor, constant: 20),
            scoreStackview.trailingAnchor.constraint(equalTo: scoreCardView.trailingAnchor, constant: -20),
            scoreStackview.bottomAnchor.constraint(equalTo: scoreCardView.bottomAnchor, constant: -40),
            scoreStackview.leadingAnchor.constraint(equalTo: scoreCardView.leadingAnchor, constant: 20)
        ])
    }
    
    func slideUpScorecard() {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseIn, animations: {
            self.scorecardTopAnchor.constant = -self.lettersView.frame.height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func slideDownScorecard() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            self.scorecardTopAnchor.constant = self.lettersView.frame.height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func resetButtons() {
        allLetters.removeAll()
        currentGuess.removeAll()
        usedLetters.removeAll()
        correctWordCount = 0
        
        //Reset Buttons
        for eachButton in alphabetButtons {
            eachButton.isEnabled = true
            eachButton.alpha = 1.0
        }
        
        setupLetters()
        setupGame(newWord: currentGameWord)
    }
    
    func endGame(state: GameEndState) {
        if state == .win {
            score += 1
        } else if state == .lose {
            score -= 1
        }
        
        setupScorecardView()
        slideUpScorecard()
    }
    
    @objc func newGameButtonPressed(button: UIButton) {
        slideDownScorecard()
        resetButtons()
    }
    
    @objc func buttonPressed(button: UIButton) {
        let letterPressed = button.titleLabel?.text!
        
        usedLetters.append(Character(letterPressed!))
        
        if currentWord.contains(String(letterPressed!)) {
            print("\(letterPressed!) is in the \(currentWord)")
            revealLetter(letter: letterPressed!)
        } else {
            print("Wrong letter selected!")
            print("\(letterPressed!) is not in the \(currentWord)")
            if allowedNumberOfGuesses == usedLetters.count {
                print("You Lose! Game Over")
                endGame(state: .lose)
            }
        }
        
        if correctWordCount == currentWord.count {
           print("You Win!")
           endGame(state: .win)
        }
    
        //Change appearance of pressed button
        button.isEnabled = false
        button.alpha = 0.3

    }
}
