//
//  HMLettersContainerView.swift
//  Hangman
//
//  Created by Jeffrey Lai on 1/10/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

<<<<<<< HEAD
protocol HMLetterContainerViewDelegate: AnyObject{
    func letterButtonPressed(letterButton: HMAlphabetButton)
    func addButtonToVC(letterButton: HMAlphabetButton)
}

class HMLettersContainerView: UIView {
    
    let numberOfRows = 6
    let numberOfLettersInEachRow = 5
    let letterColumnStackView = HMStackView()
    var letterRowStackView = [HMRowStackView]()
    
    var allLetters: [Character] = []
    var alphabetButtons = [HMAlphabetButton]()
    
    weak var delegate: HMLetterContainerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureColumnStackView()
        setupLetters()
        configure()
    }
    
    func resetAllButtons() {
        for eachButton in alphabetButtons {
            eachButton.resetButton()
        }
    }
    
    func emptyButtonAndLetters() -> [Character] {
        let alphabet = "abcdefghijklmnopqrstuvwxyz".uppercased() //26 Letters
        
        allLetters = [Character]()
        
        for (position, letter) in alphabet.enumerated() {
            allLetters.append(letter)
            let newButton = HMAlphabetButton()
            newButton.tag = position
            alphabetButtons.append(newButton)
        }
        
        return allLetters
    }
    
    func configureColumnStackView() {
        self.addSubview(letterColumnStackView)
        letterColumnStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0..<numberOfRows {
            let singleStackview = HMRowStackView()
            letterRowStackView.append(singleStackview)
        }
        
        NSLayoutConstraint.activate([
            letterColumnStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            letterColumnStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            letterColumnStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            letterColumnStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    
    func setupLetters() {
        allLetters = emptyButtonAndLetters()
        
        var index = 0
      
        for each in 0..<letterRowStackView.count {
            letterColumnStackView.addArrangedSubview(letterRowStackView[each])
            for _ in 0..<numberOfLettersInEachRow {
                if !allLetters.isEmpty {
                    let button = alphabetButtons[index]
                    let currentLetter = allLetters.removeFirst()
                    button.createAttributedText(word: currentLetter)
                    letterRowStackView[each].addArrangedSubview(button)
                    delegate?.addButtonToVC(letterButton: button)
                    
                    index += 1
                    
                    //TESTING
                    print("Current Letter: \(currentLetter) and letter count: \(allLetters.count)" )
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

=======
class HMLettersContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
>>>>>>> parent of 783ce21... Revert "Partial Refactoring"
    private func configure() {
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
