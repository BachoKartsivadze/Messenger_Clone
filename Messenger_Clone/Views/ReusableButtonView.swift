//
//  ReusableButtonView.swift
//  registrationModel
//
//  Created by bacho kartsivadze on 29.03.23.
//

import UIKit

class ReusableButtonView: UIView {

    static let identifier = "ReusableButtonView"
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Error"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // ________________________________________________________________
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        addSubview(label)
        addConstraints();
        layer.cornerRadius = 12
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with text: String){
        label.text = text
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
