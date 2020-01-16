//
//  HMAlphabetButton.swift
//  Hangman
//
//  Created by Jeffrey Lai on 1/12/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

class HMAlphabetButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createAttributedText(word: Character) {
        
        let labelFont = UIFont.preferredFont(forTextStyle: .largeTitle)
        var fontAttributes: [NSAttributedString.Key: Any]
        
        fontAttributes = [
            .font: labelFont,
            .foregroundColor: UIColor.label
        ]
        
        let attributedTextTitle =  NSAttributedString.init(string: String(word), attributes: fontAttributes)
        
        setAttributedTitle(attributedTextTitle, for: .normal)
        setTitleColor(.label, for: .normal)

    }
    
    func resetButton() {
        self.isEnabled = true
        self.alpha = 1.0
    }
    
    @objc func buttonPressed(button: UIButton) {
        let letterPressed = button.titleLabel?.text!
        
//        usedLetters.append(Character(letterPressed!))
//
//        if currentWord.contains(String(letterPressed!)) {
//            print("\(letterPressed!) is in the \(currentWord)")
//            revealLetter(letter: letterPressed!)
//
//            if correctWordCount == currentWord.count {
//               print("You Win!")
//               endGame(state: .win)
//            }
//        } else {
//            print("Wrong letter selected!")
//            print("\(letterPressed!) is not in the \(currentWord)")
//            incorrectGuessCount += 1
//            //reduceBattery(multiple: incorrectGuessCount)
//            batteryView.reduceBattery(multiple: incorrectGuessCount)
//
//            if allowedNumberOfGuesses == incorrectGuessCount {
//                print("You Lose! Game Over")
//                endGame(state: .lose)
//            }
//        }
    }
    
    private func configure() {
//        layer.borderWidth = 2
//        layer.borderColor = UIColor.systemRed.cgColor
        titleLabel?.textColor = .label
        titleLabel?.textAlignment = .center
        titleLabel?.adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }


}
