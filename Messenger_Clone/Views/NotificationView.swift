//
//  NotificationView.swift
//  registrationModel
//
//  Created by bacho kartsivadze on 05.04.23.
//

import UIKit

class NotificationView: UIView {

    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Error Occured"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        return label
    }()
    
    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Unknown"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()
    
    //--------------------------------------------------------------
    
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
        layer.cornerRadius = 10
    }
    
    private func setupView() {
        backgroundColor = .red
        addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(secondaryLabel)
        
    }
    
    public func configure(headerText: String, secondaryText: String, backGroundColor: UIColor) {
        headerLabel.text = headerText
        secondaryLabel.text = secondaryText
        self.backgroundColor = backGroundColor
    }

}
