//
//  MainVC.swift
//  Hangman
//
//  Created by Jeffrey Lai on 11/27/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class MainVC: UIViewController, HMLetterContainerViewDelegate {
    
    let allowedNumberOfGuesses = 7
    let numberOfRows = 6
    let numberOfLettersInEachRow = 5
    
    enum GameEndState {
        case win
        case lose
    }
    
    let navBarLabel: UILabel = UILabel()
    var wordLabel: HMMainWordLabel!
    let wordView = WordContainerView()
    let batteryView = HMBatteryContainerView()
    
    var scoreLabel: UILabel = UILabel()
    let newGameButton: UIButton = UIButton(type: .system)
    let scoreCardView = HMScorecardContainerView()
    
    var levelCompletedLabel: UILabel = UILabel()
    var gameStatus: UILabel = UILabel()
<<<<<<< HEAD
<<<<<<< Updated upstream
    var wordLabel: UILabel = UILabel()
    let wordView: UIView = UIView()
    let lettersView: UIView = UIView()
=======

    let lettersView = HMLettersContainerView()
>>>>>>> parent of 783ce21... Revert "Partial Refactoring"
    let letterColumnStackview: UIStackView = UIStackView()
    var letterRowStackviews = [UIStackView]()
    var alphabetButtons: [UIButton] = [UIButton]()
=======

    let lettersView = HMLettersContainerView()
//    let letterColumnStackview: UIStackView = UIStackView()
//    var letterRowStackviews = [UIStackView]()
//    var alphabetButtons: [UIButton] = [UIButton]()
>>>>>>> Stashed changes
    
    var score = 0 {
        didSet {
            scoreLabel.attributedText = createAttributedText(text: "Score: \(score)", size: 40, fontWeight: .semibold, isShadow: false, wordSpacing: 0, textColor: .label)
        }
    }
    
    var currentPosition: Int = 0
    var level = 1
    var wordList: [String] = [String]()
    var currentGameWord: String = ""
    var correctWordCount: Int = 0
    var incorrectGuessCount: Int = 0
    var currentGuess: [String] = [String]()
    var currentWord: String = ""
    var allLetters: [Character] = []
    var usedLetters: [Character] = []
    var gameCompleted: Bool = false
    var levelCompleted: Bool = false
    
    var scorecardTopAnchor: NSLayoutConstraint!
    var scorecardTrailingAnchor: NSLayoutConstraint!
    var scorecardBottomAnchor: NSLayoutConstraint!
    var scorecardLeadingAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        loadLevel()
        setupNavBar()
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
        configureWordContainerView()
        configureBatteryContainerView()
        configureLettersContainerView()
>>>>>>> parent of 783ce21... Revert "Partial Refactoring"
        setupViews()
        setupLetters()
=======
        configureWordContainerView()
        configureBatteryContainerView()
        configureLettersContainerView()
        configureScorecardContainerView()
        setupGame(newWord: currentGameWord)
        //setupViews()
        //setupLetters()
        
        lettersView.delegate = self
>>>>>>> Stashed changes
    }

    
    func setupGame(newWord: String) {
        currentWord = newWord.uppercased()
        currentGuess.removeAll()
        
        for (_,_) in currentWord.enumerated() {
            currentGuess.append("_")
        }
        
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.textAlignment = .center
        wordLabel.attributedText = createAttributedText(text: numberOfUnderscores(), size: 30, fontWeight: .heavy, isShadow: false, wordSpacing: 4, textColor: .label)
        
        //wordLabel = HMMainWordLabel.init(textAlignment: .center, word: numberOfUnderscores())
        
        gameCompleted = false
        //emptyButtonsAndLetters()
    }
    
    func setupNavBar() {
<<<<<<< HEAD
        
<<<<<<< Updated upstream
        let navTitle = createAttributedText(text: "H?NGM?N", size: 30, fontWeight: .bold, isShadow: false, wordSpacing: 20, textColor: .label)
        navBarLabel.attributedText = navTitle
        navigationItem.titleView = navBarLabel
=======
        let batterySize = batteryView.getBatterySize()
        
        NSLayoutConstraint.activate([
            batteryView.topAnchor.constraint(equalTo: wordView.bottomAnchor, constant: 10),
            batteryView.widthAnchor.constraint(equalToConstant: batterySize.width),
            batteryView.heightAnchor.constraint(equalToConstant: batterySize.height),
            batteryView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configureWordContainerView() {
        wordLabel = HMMainWordLabel.init(textAlignment: .center, word: numberOfUnderscores())
        
        wordView.addSubview(wordLabel)
        view.addSubview(wordView)
        
        NSLayoutConstraint.activate([
            wordLabel.centerYAnchor.constraint(equalTo: wordView.centerYAnchor),
            wordLabel.centerXAnchor.constraint(equalTo: wordView.centerXAnchor),
            
            wordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            wordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            wordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            wordView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureLettersContainerView() {
        view.addSubview(lettersView)
        lettersView.setupLetters()
>>>>>>> Stashed changes
        
=======
        navBarLabel.text = "H?NGM?N"
        navBarLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        navBarLabel.font = .boldSystemFont(ofSize: 50)
        navBarLabel.adjustsFontSizeToFitWidth = true
        navigationItem.titleView = navBarLabel

        navigationController?.navigationBar.tintColor = .systemRed
>>>>>>> parent of 783ce21... Revert "Partial Refactoring"
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func configureBatteryContainerView() {
        view.addSubview(batteryView)
        
        let batterySize = batteryView.getBatterySize()
        
        NSLayoutConstraint.activate([
            batteryView.topAnchor.constraint(equalTo: wordView.bottomAnchor, constant: 10),
            batteryView.widthAnchor.constraint(equalToConstant: batterySize.width),
            batteryView.heightAnchor.constraint(equalToConstant: batterySize.height),
            batteryView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configureWordContainerView() {
        wordLabel = HMMainWordLabel.init(textAlignment: .center, word: numberOfUnderscores())
        
        wordView.addSubview(wordLabel)
        view.addSubview(wordView)
        
        NSLayoutConstraint.activate([
            wordLabel.centerYAnchor.constraint(equalTo: wordView.centerYAnchor),
            wordLabel.centerXAnchor.constraint(equalTo: wordView.centerXAnchor),
            
            wordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            wordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            wordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            wordView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureLettersContainerView() {
        view.addSubview(lettersView)
        
        NSLayoutConstraint.activate([
            lettersView.topAnchor.constraint(equalTo: batteryView.bottomAnchor, constant: 10),
            lettersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lettersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lettersView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
<<<<<<< Updated upstream
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
        
        scoreCardView.backgroundColor = .systemYellow
        scoreCardView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scoreCardView)
<<<<<<< HEAD
        
        batteryFillViewTrailingAnchor = batteryFillView.trailingAnchor.constraint(equalTo: batteryView.trailingAnchor, constant: -20)
        
=======
    func configureScorecardContainerView() {
        view.addSubview(scoreCardView)
        
>>>>>>> Stashed changes
=======

>>>>>>> parent of 783ce21... Revert "Partial Refactoring"
        scorecardTopAnchor = scoreCardView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height)
        scorecardTrailingAnchor = scoreCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        scorecardLeadingAnchor = scoreCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        scorecardBottomAnchor = scoreCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            scorecardTopAnchor,
            scorecardTrailingAnchor,
            scorecardBottomAnchor,
            scorecardLeadingAnchor
        ])
        
    }
    
    //Only called once
//    func setupViews() {
//        for _ in 0..<numberOfRows {
//            let singleStackview = UIStackView()
//            singleStackview.translatesAutoresizingMaskIntoConstraints = false
//            singleStackview.distribution = .fillEqually
//            singleStackview.axis = .horizontal
//            letterRowStackviews.append(singleStackview)
//        }
//    }
    
//    func emptyButtonsAndLetters() {
//        let alphabet = "abcdefghijklmnopqrstuvwxyz".uppercased() //26 Letters
//
//        allLetters = [Character]()
//
//        for (position, letter) in alphabet.enumerated() {
//            allLetters.append(letter)
//            let newButton = UIButton(type: .system)
//            newButton.tag = position
//            alphabetButtons.append(newButton)
//        }
//    }
    
//    func setupLetters() {
//        letterColumnStackview.translatesAutoresizingMaskIntoConstraints = false
//        letterColumnStackview.distribution = .fillEqually
//        letterColumnStackview.axis = .vertical
//
//        var index = 0
//
//        for each in 0..<letterRowStackviews.count {
//            letterColumnStackview.addArrangedSubview(letterRowStackviews[each])
//            for _ in 0..<numberOfLettersInEachRow {
//                if !allLetters.isEmpty {
//                    let button = alphabetButtons[index]
//                    let currentLetter = allLetters.removeFirst()
//                    button.setAttributedTitle(createAttributedText(text: String(currentLetter), size: 30, fontWeight: .bold, isShadow: false, wordSpacing: 0, textColor: .label), for: .normal)
//                    letterRowStackviews[each].addArrangedSubview(button)
//                    button.addTarget(self, action:#selector(buttonPressed(button:)), for: .touchUpInside)
//
//                    index += 1
//
//                    //TESTING
//                    print("Current Letter: \(currentLetter) and letter count: \(allLetters.count)" )
//                }
//            }
//        }
//
//        lettersView.addSubview(letterColumnStackview)
//
//        NSLayoutConstraint.activate([
//            letterColumnStackview.topAnchor.constraint(equalTo: lettersView.topAnchor, constant: 10),
//            letterColumnStackview.trailingAnchor.constraint(equalTo: lettersView.trailingAnchor, constant: -10),
//            letterColumnStackview.bottomAnchor.constraint(equalTo: lettersView.bottomAnchor, constant: -10),
//            letterColumnStackview.leadingAnchor.constraint(equalTo: lettersView.leadingAnchor, constant: 10)
//        ])
//    }
    
    //Only to be called when game is reset
    func numberOfUnderscores() -> String {
        let number = currentWord.count
        var underscores:String = ""
    
        for _ in 0..<number {
            underscores = underscores + "_"
        }
        
        return underscores
    }
    
    func loadLevel() {
        
        wordList.removeAll()
        
        DispatchQueue.global(qos: .userInteractive).async {
            if let levelFileURL = Bundle.main.url(forResource: "level\(self.level)", withExtension: "txt") {
                
                if let levelWords = try? String(contentsOf: levelFileURL) {
                    var lines = levelWords.components(separatedBy: "\n")
                    lines.shuffle()
                    
                    for (_, word) in lines.enumerated() {
                        if word != "" {
                            print("Added \(word) to wordlist ")
                            self.wordList.append(word)
                        }
                    }
                }
            }
        }
        
        DispatchQueue.main.async {
            self.currentPosition = 0
            self.currentWord = self.wordList[self.currentPosition]
            self.setupGame(newWord: self.currentWord)
           
            if self.currentPosition == self.wordList.count - 1 {
                self.levelCompleted = true
            } else {
                self.levelCompleted = false
            }

        }
    }
    
    func nextWord() {
        let count = wordList.count - 1
        if currentPosition == count {
            levelCompleted = true
            self.level += 1
            setupScorecardView()
            loadLevel()
        } else {
            print("Current position is \(currentPosition): Next Word")
            currentPosition += 1
            currentWord = wordList[currentPosition]
        }
    }
    
    func nextLevel() {
        
    }
    
    func createAttributedText(text: String, size: CGFloat, fontWeight: UIFont.Weight , isShadow: Bool, wordSpacing: CGFloat, textColor: UIColor) -> NSAttributedString {
        let buttonFont = UIFont.systemFont(ofSize: size, weight: fontWeight)
        var fontAttributes: [NSAttributedString.Key: Any]
        
        if isShadow {
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.black
            shadow.shadowBlurRadius = 2
            
            fontAttributes = [
                .font: buttonFont,
                .foregroundColor: textColor,
                .shadow: shadow,
                .kern: wordSpacing
            ]
        } else {
            fontAttributes = [
                .font: buttonFont,
                .foregroundColor: textColor,
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
                wordLabel.attributedText = createAttributedText(text: currentGuess.joined(), size: 30, fontWeight: .heavy, isShadow: false, wordSpacing: 10, textColor: .label)
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
        
        gameStatus.textAlignment = .center
        gameStatus.translatesAutoresizingMaskIntoConstraints = false
        
        levelCompletedLabel.textAlignment = .center
        levelCompletedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        if levelCompleted == true {
            newGameButton.setAttributedTitle(createAttributedText(text: "Next Level", size: 30, fontWeight: .medium, isShadow: false, wordSpacing: 0, textColor: .label), for: .normal)
        } else {
            newGameButton.setAttributedTitle(createAttributedText(text: "Next Word", size: 30, fontWeight: .medium, isShadow: false, wordSpacing: 0, textColor: .label), for: .normal)
        }

        newGameButton.translatesAutoresizingMaskIntoConstraints = false
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
        scoreStackview.addArrangedSubview(gameStatus)
        
        if levelCompleted == true {
            levelCompletedLabel.attributedText = createAttributedText(text: "Level Completed", size: 30, fontWeight: .semibold, isShadow: false, wordSpacing: 0, textColor: .label)
            scoreStackview.addArrangedSubview(levelCompletedLabel)
        } else {
            levelCompletedLabel.attributedText = createAttributedText(text: "", size: 30, fontWeight: .semibold, isShadow: false, wordSpacing: 0, textColor: .label)
            scoreStackview.removeArrangedSubview(levelCompletedLabel)
        }
        
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
            self.scorecardTopAnchor.constant = self.wordView.frame.height * 2 + self.batteryView.frame.height - 35
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func slideDownScorecard() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.scorecardTopAnchor.constant = self.view.frame.height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func resetButtons() {
        allLetters.removeAll()
        currentGuess.removeAll()
        usedLetters.removeAll()
        correctWordCount = 0
        incorrectGuessCount = 0
        
        lettersView.resetAllButtons()
        lettersView.setupLetters()
       
        //Reset Buttons
<<<<<<< Updated upstream
        for eachButton in alphabetButtons {
            eachButton.isEnabled = true
            eachButton.alpha = 1.0
        }
 
        batteryView.resetBattery()
        
        setupLetters()
=======
//        for eachButton in alphabetButtons {
//            eachButton.isEnabled = true
//            eachButton.alpha = 1.0
//        }
 
        batteryView.resetBattery()
        
        
>>>>>>> Stashed changes
    }
    
    func endGame(state: GameEndState) {
        if state == .win {
            if incorrectGuessCount == 0 {
                score += 5
            } else if incorrectGuessCount >= 1 && incorrectGuessCount <= 3 {
                score += 3
            } else if incorrectGuessCount >= 4 &&
                incorrectGuessCount < 6 {
                score += 2
            } else if incorrectGuessCount >= 6 {
                score += 1
            }
            
            gameStatus.attributedText = createAttributedText(text: "You Win!", size: 60, fontWeight: .bold, isShadow: false, wordSpacing: 0, textColor: .label)
        } else if state == .lose {
            score -= 5
            gameStatus.attributedText = createAttributedText(text: "You Lose!", size: 60, fontWeight: .bold, isShadow: false, wordSpacing: 0, textColor: .label)
        }
        
        setupScorecardView()
        slideUpScorecard()
    }
    
    
    @objc func newGameButtonPressed(button: UIButton) {
        //This does not work?
        if levelCompleted == true {
            print("Implement Next Level")
            resetButtons()
            nextWord()
            setupGame(newWord: currentWord)
            levelCompleted = false
            slideDownScorecard()
        } else {
            nextWord()
            slideDownScorecard()
            resetButtons()
            setupGame(newWord: currentWord)
        }
    }
    
    func letterButtonPressed(letterButton: HMAlphabetButton) {
        print("Pressed Button: \(String(describing: letterButton.titleLabel?.text))")
    }
    
    func addButtonToVC(letterButton: HMAlphabetButton) {
        print("Adding Target")
        letterButton.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(button: UIButton) {
        let letterPressed = button.titleLabel?.text!
        
        usedLetters.append(Character(letterPressed!))
        
        if currentWord.contains(String(letterPressed!)) {
            print("\(letterPressed!) is in the \(currentWord)")
            revealLetter(letter: letterPressed!)
            
            if correctWordCount == currentWord.count {
               print("You Win!")
               endGame(state: .win)
            }
        } else {
            print("Wrong letter selected!")
            print("\(letterPressed!) is not in the \(currentWord)")
            incorrectGuessCount += 1
            //reduceBattery(multiple: incorrectGuessCount)
            batteryView.reduceBattery(multiple: incorrectGuessCount)
            
            if allowedNumberOfGuesses == incorrectGuessCount {
                print("You Lose! Game Over")
                endGame(state: .lose)
            }
        }
        
        //Change appearance of pressed button
        button.isEnabled = false
        button.alpha = 0.3
    }
}
