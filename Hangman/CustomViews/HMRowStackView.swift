//
//  HMRowStackView.swift
//  Hangman
//
//  Created by Jeffrey Lai on 1/12/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

class HMRowStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(listOfSubviews: [UIView]) {
        for index in 0..<listOfSubviews.count {
            self.addArrangedSubview(listOfSubviews[index])
        }
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        axis = .horizontal
        alignment = .center
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
}
