//
//  GamersResultViewController.swift
//  SurfIT
//
//  Created by Сергей Юханов on 30.03.2022.
//

import UIKit

class GamersResultViewController: UIViewController {
    
    private let gamersResultTextField = NumberTextField()
    private let enterNumberButton = CustomButton()
    
    var numberModel = NumbersModel(computersNumber: 0, myNumber: 0, myNumberEnterred: 0, computerNumberEnterred: 0)
    var myNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        view.backgroundColor = .systemBlue
    }
    
    
    private func setupViews() {
        enterNumberButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        view.addSubview(gamersResultTextField)
        view.addSubview(enterNumberButton)
    }
    
    @objc func enterButtonTapped() {
        if let text = gamersResultTextField.text {
            guard let number = Int(text.filter { $0.isWholeNumber }) else { return }
            print(number)
            
            let computersResultVC = ComputersResultViewController()
            computersResultVC.numberModel.myNumber = number
            self.present(computersResultVC, animated: true, completion: nil)
            
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

extension GamersResultViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            gamersResultTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            gamersResultTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gamersResultTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //
            enterNumberButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            enterNumberButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterNumberButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
