//
//  ViewController.swift
//  SurfIT
//
//  Created by Сергей Юханов on 29.03.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    private let nameLabel = MainLabel()
    private let startNewGameButton = StartNewGameButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        setViews()
        setConstraints()
        
        
        
    }
    
    private func setViews() {
        nameLabel.text = "gameName"
        startNewGameButton.addTarget(self, action: #selector(showGuessTheNumberVC), for: .touchUpInside)
        view.addSubview(nameLabel)
        view.addSubview(startNewGameButton)
    }
    
    @objc func showGuessTheNumberVC() {
        let guessVC = GuessTheNumberViewController()
        self.navigationController?.show(guessVC, sender: nil)
    }
    
    
}

extension StartViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //Constraints to NameLabel
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //Constraints to StartNewGameButton
            startNewGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            startNewGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startNewGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startNewGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
