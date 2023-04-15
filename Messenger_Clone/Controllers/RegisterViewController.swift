//
//  RegisterViewController.swift
//  Messenger_Clone
//
//  Created by bacho kartsivadze on 11.04.23.
//

import UIKit

class RegisterViewController: UIViewController {

    private let profileImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person")
        view.tintColor = .gray
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
//        scrollView.isUserInteractionEnabled = true
        return scrollView
    }()
    
    private let firstnameTextfield = ReusableTextField()
    private let lastnameTextfield = ReusableTextField()
    private let emailTextfield = ReusableTextField()
    private let passwordTextfield = ReusableTextField()
    private let registerButton = ReusableButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubViews()
        addTargets()
        configureViews()
        setupConstraints()
    }

    private func addSubViews() {
        scrollView.addSubview(profileImage)
        scrollView.addSubview(firstnameTextfield)
        scrollView.addSubview(lastnameTextfield)
        scrollView.addSubview(emailTextfield)
        scrollView.addSubview(passwordTextfield)
        scrollView.addSubview(registerButton)
        view.addSubview(scrollView)
    }
    
    private func addTargets() {
        registerButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapRegisterButton)))
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapChangeProfilePic)))
    }
    
    
    @objc private func tapChangeProfilePic() {
        print("Tapped profile pic")
    }
    
    @objc private func tapRegisterButton() {
        hideKeyboard()
        
        guard let firstname = firstnameTextfield.text,
              let lastname = lastnameTextfield.text,
              let email = emailTextfield.text,
              let password = passwordTextfield.text,
              !firstname.isEmpty,
              !lastname.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              password.count >= 6 else {
            showErrorAlert()
            return
        }
        
        print("tapped Login Button")
    }
    
    private func hideKeyboard() {
        emailTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        firstnameTextfield.resignFirstResponder()
        lastnameTextfield.resignFirstResponder()
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "error", message: "please input all the information to create a new account", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    private func configureViews() {
        scrollView.frame = view.bounds
        emailTextfield.placeholder = "Email..."
        passwordTextfield.placeholder = "Password..."
        firstnameTextfield.placeholder = "First Name"
        lastnameTextfield.placeholder = "Last Name"
        registerButton.configure(with: "Register")
        registerButton.backgroundColor = .systemGreen
        passwordTextfield.isSecureTextEntry = true
        
        firstnameTextfield.delegate = self
        lastnameTextfield.delegate = self
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            
            firstnameTextfield.widthAnchor.constraint(equalToConstant: 320),
            firstnameTextfield.heightAnchor.constraint(equalToConstant: 54),
            firstnameTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstnameTextfield.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 30),
            
            lastnameTextfield.widthAnchor.constraint(equalToConstant: 320),
            lastnameTextfield.heightAnchor.constraint(equalToConstant: 54),
            lastnameTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastnameTextfield.topAnchor.constraint(equalTo: firstnameTextfield.bottomAnchor, constant: 30),
            
            emailTextfield.widthAnchor.constraint(equalToConstant: 320),
            emailTextfield.heightAnchor.constraint(equalToConstant: 54),
            emailTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextfield.topAnchor.constraint(equalTo: lastnameTextfield.bottomAnchor, constant: 30),
            
            passwordTextfield.widthAnchor.constraint(equalToConstant: 320),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 54),
            passwordTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 30),
            
            registerButton.widthAnchor.constraint(equalToConstant: 320),
            registerButton.heightAnchor.constraint(equalToConstant: 54),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 30),
        ])
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstnameTextfield {
            lastnameTextfield.becomeFirstResponder()
        } else if textField == lastnameTextfield {
            emailTextfield.becomeFirstResponder()
        } else if textField == emailTextfield {
            passwordTextfield.becomeFirstResponder()
        } else if textField == passwordTextfield {
            tapRegisterButton()
        }
        
        return true
    }

}
