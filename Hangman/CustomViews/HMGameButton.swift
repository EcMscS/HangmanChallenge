//
//  HMGameButton.swift
//  Hangman
//
//  Created by Jeffrey Lai on 1/10/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

class HMGameButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(buttonText: String) {
        super.init(frame: .zero)
        titleLabel?.text = buttonText
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 25
        layer.borderColor = UIColor.systemGray2.cgColor
        layer.borderWidth = 2
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        titleLabel?.textColor = .white
        titleLabel?.textAlignment = .center
        backgroundColor = .systemBackground
    }

}
