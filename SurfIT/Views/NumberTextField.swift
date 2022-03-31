//
//  EnterTheNumberTextField.swift
//  SurfIT
//
//  Created by Сергей Юханов on 29.03.2022.
//

import UIKit

class NumberTextField: UITextField, UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let minValue = 1
            let maxValue = 100
            lazy var valuesRange = minValue...maxValue
        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
            
            if newText.isEmpty {
              return true
            }
            
            return valuesRange.contains(Int(newText) ?? minValue - 1)
          }
    
    

    
    private func configure() {
        backgroundColor = .white
        borderStyle = .line
        
        
        returnKeyType = .done
        leftView = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 15,
                                        height: self.frame.height))
        
        leftViewMode = .always
        placeholder = "Guess the number"
        keyboardType = .numberPad
       // tintColor = UIColor(red: 179, green: 178, blue: 179, alpha: 0)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

