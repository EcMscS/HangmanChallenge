//
//  HMScorecardContainerView.swift
//  Hangman
//
//  Created by Jeffrey Lai on 1/10/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

class HMScorecardContainerView: UIView {

    var scoreLabel = HMScorecardLabel()
    var gameStatusLabel = HMScorecardLabel()
    var levelCompletedLabel = HMScorecardLabel()
    let newGameButton = HMGameButton()
    
    let scoreStacks = HMStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setScoreLabel(score: Int) {
        scoreLabel.text = "Score: \(score)"
    }
    
    func setGameStatusLabel(win: Bool) {
        if win {
            gameStatusLabel.text = "You Win!"
        } else {
            gameStatusLabel.text = "You Lose!"
        }
    }
    
    func setLevelCompletedLabel(completed: Bool) {
        if completed {
            levelCompletedLabel.text = "Level Completed"
        } else {
            levelCompletedLabel.text = ""
        }
    }
    
    private func configure() {
        layer.cornerRadius = 25
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] //Top left and Top right corners
        backgroundColor = .systemYellow
        translatesAutoresizingMaskIntoConstraints = false
    }

}
