//
//  ComputersResultViewController.swift
//  SurfIT
//
//  Created by Сергей Юханов on 29.03.2022.
//

import UIKit

class ComputersResultViewController: UIViewController {
    
    var guessingNumber = 0
    
    var numberModel = NumbersModel(computersNumber: 0, myNumber: 0, myNumberEnterred: 0, computerNumberEnterred: 0)
    //private let binarySearch = BinarySearch(mainArray: Array(1...100), newArray: [])
    var mainArray = Array(0...100)
    var newArray = [Int]()
    var target = 0
    
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

    
        print(guessingNumber)
        
        findNumber()
        setupViews()
        setConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    private func setupViews() {
        lessButton.setTitle(">", for: .normal)
        equalButton.setTitle("=", for: .normal)
        moreButton.setTitle("<", for: .normal)
        
        lessButton.addTarget(self, action: #selector(lessButtonTapped), for: .touchUpInside)
        roundLabel.text = "Round №"
        whoseGuessesLabel.text = "computer guesses"
        guessesLabel.text = "number is - \(target)"
        buttonsStackView.distribution = .fillEqually
        view.addSubview(roundLabel)
        view.addSubview(whoseGuessesLabel)
        view.addSubview(guessesLabel)
        view.addSubview(buttonsStackView)
        
    }
    
    @objc func lessButtonTapped() {
        findNumber()


    }
    
    func findNumber() {
        target = mainArray.count / 2
        print(target)
        binarySearch(array: mainArray, target: target)
        print(mainArray)
        guessesLabel.text = "number is - \(target)"
    }
    

    func binarySearch(array: [Int], target: Int) {

         for i in 1...(array.count - 1) {
             if target > array[i] {
                 newArray = Array(1...array[i + 1])
                 mainArray = newArray
                 
             } else {
                 
             }
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
