//
//  ComputersResultViewController.swift
//  SurfIT
//
//  Created by Сергей Юханов on 29.03.2022.
//

import UIKit

class ComputersResultViewController: UIViewController {
    
    var number = 0
    
    private let roundLabel = MainLabel()
    private let whoseGuessesLabel = MainLabel()
    private let guessesLabel = MainLabel()
    private let lessButton = customButton()
    private let equalButton = customButton()
    private let moreButton = customButton()
    
    private lazy var buttonsStackView = UIStackView(arrangedSubviews: [lessButton, equalButton, moreButton], axis: .horizontal, spacing: 10)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .white
        print(number)
        setupViews()
        setConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        lessButton.setTitle(">", for: .normal)
        equalButton.setTitle("=", for: .normal)
        moreButton.setTitle("<", for: .normal)
        //view.addSubview(buttonsStackView)
        roundLabel.text = "Round №"
        whoseGuessesLabel.text = "computer guesses"
        guessesLabel.text = "number is - \(calculateRandomNumber())"
        buttonsStackView.distribution = .fillEqually
        view.addSubview(roundLabel)
        view.addSubview(whoseGuessesLabel)
        view.addSubview(guessesLabel)
        view.addSubview(buttonsStackView)
        
    }
    
    private func calculateRandomNumber() -> Int {
        let randomNumber = Int.random(in: 0...100) //по условию ТЗ 0...Int.max
        return randomNumber
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ComputersResultViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //Constraints to RoundLabel
            roundLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            roundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //
            whoseGuessesLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 20),
            whoseGuessesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //
            guessesLabel.topAnchor.constraint(equalTo: whoseGuessesLabel.bottomAnchor, constant: 100),
            guessesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 40)
        
        ])
    }
}
