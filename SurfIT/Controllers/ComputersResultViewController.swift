//
//  ComputersResultViewController.swift
//  SurfIT
//
//  Created by Сергей Юханов on 29.03.2022.
//

import UIKit

class ComputersResultViewController: UIViewController {
    
    var guessedNumber = 0
    
    var numberModel = NumbersModel(computersNumber: 0, myNumber: 0, myNumberEnterred: 0, computerNumberEnterred: 0)

    
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

    
        print(guessedNumber)
        
        
        
        setupViews()
        setConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    private func setupViews() {
        lessButton.setTitle(">", for: .normal)
        equalButton.setTitle("=", for: .normal)
        moreButton.setTitle("<", for: .normal)
        
        lessButton.addTarget(self, action: #selector(lessButtonTapped), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        roundLabel.text = "Round № \(counter)"
        whoseGuessesLabel.text = "computer guesses"
        guessesLabel.text = "number is - \(mid)"
        buttonsStackView.distribution = .fillEqually
        view.addSubview(roundLabel)
        view.addSubview(whoseGuessesLabel)
        view.addSubview(guessesLabel)
        view.addSubview(buttonsStackView)
        
    }
    
    @objc func lessButtonTapped() {
        lessFindNumber()
    }
    
    @objc func moreButtonTapped() {
        moreFindNumber()
    }
    
    func lessFindNumber() {
        if guessedNumber > mid {
            mid = mid + max / 2
            print(mid)
            guessesLabel.text = "number is - \(mid)"
            counter += 1
            roundLabel.text = "Round № \(counter)"
        } else {
            print("my number is less")
        }
    }
    
    func moreFindNumber() {
        if guessedNumber < mid {
            mid = mid + min / 2
            print(mid)
            guessesLabel.text = "number is - \(mid)"
            counter += 1
            roundLabel.text = "Round № \(counter)"
        } else {
            print("my number is more")
        }
    }
    
    
//
//    func findNumber() {
//        target = mainArray.count / 2
//        binarySearch(array: mainArray, target: target)
//        guessesLabel.text = "number is - \(target)"
//        counter += 1
//        roundLabel.text = "Round № \(counter)"
//
//    }
//
//
//    func binarySearch(array: [Int], target: Int) {
//
//         for i in 1...(array.count - 1) {
//             if target > array[i] {
//                 newArray = Array(1...array[i + 1])
//                 mainArray = newArray
//
//             } else if target == mainArray.count {
//                 print("Computers win")
//             }
//         }
//     }

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
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 40)
        
        ])
    }
}
