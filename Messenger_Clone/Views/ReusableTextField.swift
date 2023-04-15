//
//  ReusableTextField.swift
//  Messenger_Clone
//
//  Created by bacho kartsivadze on 11.04.23.
//

import UIKit

class ReusableTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: CGRect())
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        placeholder = "error"
        autocapitalizationType = .none
        autocorrectionType = .no
        returnKeyType = .done
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        leftViewMode = .always
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
}
