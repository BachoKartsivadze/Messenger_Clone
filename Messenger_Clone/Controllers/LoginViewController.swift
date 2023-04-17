//
//  LoginViewController.swift
//  Messenger_Clone
//
//  Created by bacho kartsivadze on 11.04.23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let messengerLogo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ml2")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let emailTextfield = ReusableTextField()
    private let passwordTextfield = ReusableTextField()
    private let loginButton = ReusableButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        addSubViews()
        addTargets()
        configureViews()
        setupConstraints()
        
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(tapRegisterButton))
    }
    
    @objc private func tapRegisterButton() {
        // Get a reference to the current navigation controller
        guard let navigationController = self.navigationController else {
            return
        }

        // Create a new instance of the view controller you want to push onto the stack
        let newViewController = RegisterViewController()

        newViewController.title = "Create Account"
        
        // Push the new view controller onto the navigation stack
        navigationController.pushViewController(newViewController, animated: true)
    }

    private func addSubViews() {
        scrollView.addSubview(messengerLogo)
        scrollView.addSubview(emailTextfield)
        scrollView.addSubview(passwordTextfield)
        scrollView.addSubview(loginButton)
        view.addSubview(scrollView)
    }
    
    private func addTargets() {
        loginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLoginButton)))
    }
    
    
    @objc private func tapLoginButton() {
        emailTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
        
        guard let email = emailTextfield.text, let password = passwordTextfield.text, !email.isEmpty, !password.isEmpty,
              password.count >= 6 else {
            showErrorAlert()
            return
        }
        
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard let result = authResult, error == nil else {
                print("error sign in user")
                return
            }
            
            let user = result.user
            print("sugned in \(user)")
        }
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "error", message: "please input all the information to log in", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    private func configureViews() {
        scrollView.frame = view.bounds
        emailTextfield.placeholder = "Email..."
        passwordTextfield.placeholder = "Password..."
        loginButton.configure(with: "Login")
        passwordTextfield.isSecureTextEntry = true
        
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            messengerLogo.heightAnchor.constraint(equalToConstant: 100),
            messengerLogo.widthAnchor.constraint(equalToConstant: 100),
            messengerLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messengerLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            
            emailTextfield.widthAnchor.constraint(equalToConstant: 320),
            emailTextfield.heightAnchor.constraint(equalToConstant: 54),
            emailTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextfield.topAnchor.constraint(equalTo: messengerLogo.bottomAnchor, constant: 30),
            
            passwordTextfield.widthAnchor.constraint(equalToConstant: 320),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 54),
            passwordTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 30),
            
            loginButton.widthAnchor.constraint(equalToConstant: 320),
            loginButton.heightAnchor.constraint(equalToConstant: 54),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 30),
        ])
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextfield {
            passwordTextfield.becomeFirstResponder()
        } else if textField == passwordTextfield {
            tapLoginButton()
        }
        
        return true
    }
}
