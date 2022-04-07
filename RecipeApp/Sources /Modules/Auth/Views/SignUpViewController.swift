//
//  SignUpViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {

    // MARK: - Internal Properties

    var presenter: SignUpPresenterInput?

    // MARK: - Private Properties
    
    lazy var emailTextField = UITextField()
    lazy var usernameTextField = UITextField()
    lazy var passwordTextField = UITextField()
    
    var authManagement = FirebaseAuthManager()
    
    override func viewDidLoad() {
        
        presenter?.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        
        view.backgroundColor = .white
        
        let username = usernameTextField
        usernameTextField.borderStyle = .bezel
        usernameTextField.placeholder = "username"
        view.addSubview(username)
        usernameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(100)
        }
        
        let email = emailTextField
        emailTextField.borderStyle = .bezel
        emailTextField.placeholder = "email"
        view.addSubview(email)
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(usernameTextField).inset(50)
    }
        
        let password = passwordTextField
        passwordTextField.borderStyle = .bezel
        passwordTextField.placeholder = "password"
        view.addSubview(password)
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(emailTextField).inset(50)
        }
        
        let registerButton = UIButton()
        registerButton.backgroundColor = UIColor(red: 109/255, green: 172/255, blue: 186/255, alpha: 1)
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "Mustica Pro", size: 20)
        registerButton.layer.cornerRadius = 20
        registerButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(passwordTextField).inset(50)
            make.height.equalTo(40)
        }
    }
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let username = usernameTextField.text else { return }
        
        presenter?.signup(email: email, username: username, password: password)
    }
}

// MARK: - SuggestionPresenterOutput

extension SignUpViewController: AuthPresenterOutput {
   
    func setState(_ state: AuthState) {
        switch state {
        case .done:
            self.view.backgroundColor = .green
        case .start:
            self.view.backgroundColor = .systemTeal
        case .failure:
            self.view.backgroundColor = .red
        }
    }
}


