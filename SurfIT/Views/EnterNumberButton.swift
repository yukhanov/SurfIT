//
//  EnterNumberButton.swift
//  SurfIT
//
//  Created by Сергей Юханов on 29.03.2022.
//

import UIKit

class EnterNumberButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle("Enter the number", for: .normal)
        backgroundColor = .white
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel?.numberOfLines = 1
        layer.borderWidth = 1

        titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        
        
        

        translatesAutoresizingMaskIntoConstraints = false
    }

}
