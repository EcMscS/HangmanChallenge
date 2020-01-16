//
//  HMScorecardLabel.swift
//  Hangman
//
//  Created by Jeffrey Lai on 1/10/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

class HMScorecardLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String) {
        super.init(frame: .zero)
        self.attributedText = createAttributedText(word: text)
        configure()
    }
    
    func changeText(text: String) {
        attributedText = createAttributedText(word: text)
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byTruncatingTail
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func createAttributedText(word: String) -> NSAttributedString {
        
        let labelFont = UIFont.preferredFont(forTextStyle: .largeTitle)
        var fontAttributes: [NSAttributedString.Key: Any]
        
        fontAttributes = [
            .font: labelFont,
            .foregroundColor: UIColor.label
        ]
        
        return NSAttributedString.init(string: word, attributes: fontAttributes)
    }
}
