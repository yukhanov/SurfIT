//
//  EnterTheNumberTextField.swift
//  SurfIT
//
//  Created by Сергей Юханов on 29.03.2022.
//

import UIKit

class NumberTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
