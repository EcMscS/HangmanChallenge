//
//  MainVC.swift
//  Hangman
//
//  Created by Jeffrey Lai on 11/27/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupViews()
    }
    
    func setupNavBar() {
        title = "Hangman"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
    }
}
