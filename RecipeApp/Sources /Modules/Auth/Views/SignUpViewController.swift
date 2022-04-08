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
    
    lazy var emailTextField = customUITextField()
    lazy var usernameTextField  = customUITextField()
    lazy var passwordTextField = customUITextField()
    
    override func viewDidLoad() {
        
        presenter?.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        
        view.backgroundColor = .customWhite
        
        let createUser = UILabel()
        createUser.text = "Create new account"
        createUser.font = .systemFont(ofSize: 30)
        view.addSubview(createUser)
        createUser.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
        
        let username = usernameTextField
        usernameTextField.placeholder = "Username"
        view.addSubview(username)
        usernameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(createUser).inset(100)
        }
        
        let email = emailTextField
        emailTextField.placeholder = "Email"
        view.addSubview(email)
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(usernameTextField).inset(50)
    }
        
        let password = passwordTextField
        passwordTextField.placeholder = "Password"
        view.addSubview(password)
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(emailTextField).inset(50)
        }
        
        let registerButton = UIButton()
        registerButton.createRectangleButton(buttonTilte: "register", font: "Mustica Pro")
        registerButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
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
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Invalid values", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}


