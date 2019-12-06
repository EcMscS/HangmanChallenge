//
//  MainVC.swift
//  Hangman
//
//  Created by Jeffrey Lai on 11/27/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var wordLabel: UILabel!
    var wordView: UIView!
    var lettersView: UIView!
    
    var currentWord: String = ""
    var allLetters: [Character] = []
    var usedLetters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupViews()
        setupLetters()
    }
    
    func setupGame() {
        currentWord = "protein"
        print("Current word is: \(currentWord)")
    }
    
    func setupNavBar() {
        title = "H?ngm?n"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupViews() {
        setupGame()
        
        view.backgroundColor = .systemBackground
    
        wordLabel = UILabel()
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.attributedText = createAttributedText(text: numberOfUnderscores(), size: 50, fontWeight: .heavy, isShadow: false, wordSpacing: 10)
        wordLabel.textAlignment = .center
        
        wordView = UIView()
        wordView.backgroundColor = .systemRed
        wordView.translatesAutoresizingMaskIntoConstraints = false
        wordView.addSubview(wordLabel)
        
        lettersView = UIView()
        lettersView.backgroundColor = .systemBlue
        lettersView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(wordView)
        view.addSubview(lettersView)
        
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
            lettersView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func setupLetters() {
        let alphabet = "abcdefghijklmnopqrstuvwxyz" //26 Letters
        
        allLetters = [Character]()
        
        for (_, letter) in alphabet.enumerated() {
            allLetters.append(letter)
        }
        
        let columnStackview = UIStackView()
        columnStackview.translatesAutoresizingMaskIntoConstraints = false
        columnStackview.distribution = .fillEqually
        columnStackview.axis = .vertical
        
        let rows = 6
        for _ in 0..<rows {
            let rowStackview = UIStackView()
            rowStackview.translatesAutoresizingMaskIntoConstraints = false
            rowStackview.distribution = .fillEqually
            rowStackview.axis = .horizontal
            columnStackview.addArrangedSubview(rowStackview)
            for _ in 0..<5 {
                if !allLetters.isEmpty {
                    let button = UIButton(type: .system)
                    let currentLetter = allLetters.removeFirst()
                    button.setAttributedTitle(createAttributedText(text: String(currentLetter), size: 30, fontWeight: .bold, isShadow: true, wordSpacing: 0), for: .normal)
                    rowStackview.addArrangedSubview(button)
                    button.addTarget(self, action:#selector(buttonPressed(button:)), for: .touchUpInside)
                    
                    //TESTING
                    print("Current Letter: \(currentLetter) and letter count: \(allLetters.count)" )
                }
            }
        }
        
        lettersView.addSubview(columnStackview)
        
        NSLayoutConstraint.activate([
            columnStackview.topAnchor.constraint(equalTo: lettersView.topAnchor, constant: 10),
            columnStackview.trailingAnchor.constraint(equalTo: lettersView.trailingAnchor, constant: -10),
            columnStackview.bottomAnchor.constraint(equalTo: lettersView.bottomAnchor, constant: -10),
            columnStackview.leadingAnchor.constraint(equalTo: lettersView.leadingAnchor, constant: 10)
        ])
    }
    
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
    
    @objc func buttonPressed(button: UIButton) {
        
    }
}
