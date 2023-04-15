//
//  ConversationViewController.swift
//  Messenger_Clone
//
//  Created by bacho kartsivadze on 11.04.23.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loginIfNotLoggedIn()
    }


    private func loginIfNotLoggedIn() {
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_In")
        
        if !isLoggedIn {
            let loginController = LoginViewController()
            loginController.title = "Login"
            let nav = UINavigationController(rootViewController: loginController)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
    }
    
}

