//
//  ComputersResultViewController.swift
//  SurfIT
//
//  Created by Сергей Юханов on 29.03.2022.
//

import UIKit

class ComputersResultViewController: UIViewController {
    
    var numberModel = NumbersModel()
    
    
    var min = 0
    var max = 100
    var mid = 0
    var counter = 1
    
    private let roundLabel = MainLabel()
    private let whoseGuessesLabel = MainLabel()
    private let guessesLabel = MainLabel()
    private let lessButton = CustomButton()
    private let equalButton = CustomButton()
    private let moreButton = CustomButton()
    
    private lazy var buttonsStackView = UIStackView(arrangedSubviews: [lessButton, equalButton, moreButton], axis: .horizontal, spacing: 10)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        print(numberModel.myNumber)
        
        setupViews()
        setConstraints()
        
    }
    
    
    
    private func setupViews() {
        lessButton.setTitle(">", for: .normal)
        equalButton.setTitle("=", for: .normal)
        moreButton.setTitle("<", for: .normal)
        
        lessButton.addTarget(self, action: #selector(lessButtonTapped), for: .touchUpInside)
        equalButton.addTarget(self, action: #selector(equalButtonTapped), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        counter = 1
        roundLabel.text = "Round № \(counter)"
        whoseGuessesLabel.text = "computer guesses"
        mid = (min + max) / 2
        guessesLabel.text = "number is - \(mid)?"
        buttonsStackView.distribution = .fillEqually
        
        
        view.addSubview(roundLabel)
        view.addSubview(whoseGuessesLabel)
        view.addSubview(guessesLabel)
        view.addSubview(buttonsStackView)
        
    }
    
    @objc func lessButtonTapped() {
        moreFindNumber()
    }
    
    @objc func equalButtonTapped() {
        if numberModel.myNumber == mid {
            equalButton.isEnabled = true
            print("I'm enabled")
            let gamersResultVC = GamersResultViewController()
            gamersResultVC.compCounter = counter
            present(gamersResultVC, animated: true, completion: nil)
        }
    }
    
    @objc func moreButtonTapped() {
        lessFindNumber()
    }
    
    func lessFindNumber() {
        if numberModel.myNumber < mid {
            max = mid
            mid = (min + max) / 2
            counter += 1
            
            guessesLabel.text = "number is - \(mid)?"
            roundLabel.text = "Round № \(counter)"
        }
    }
    
    func moreFindNumber() {
        if numberModel.myNumber > mid {
            min = mid
            mid = (min + max) / 2
            guessesLabel.text = "number is - \(mid)?"
            counter += 1
            roundLabel.text = "Round № \(counter)"
        }
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
            //
            roundLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            roundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //
            whoseGuessesLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 20),
            whoseGuessesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //
            guessesLabel.topAnchor.constraint(equalTo: whoseGuessesLabel.bottomAnchor, constant: 100),
            guessesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}
