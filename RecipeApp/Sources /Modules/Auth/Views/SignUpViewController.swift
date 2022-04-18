//
//  SignUpViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    var presenter: SignUpPresenterInput?
    
    private lazy var emailTextField = RoundedTextField()
    private lazy var usernameTextField  = RoundedTextField()
    private lazy var passwordTextField = RoundedTextField()
    private lazy var createUserLabel = UILabel()
    private lazy var registerButton = UIButton()
    
    override func viewDidLoad() {
        
        presenter?.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.backgroundColor = .customWhite
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
        }
        
        let createUser = createUserLabel
        createUser.text = "Create new account"
        createUser.font = .boldSystemFont(ofSize: 30)
        contentView.addSubview(createUser)
        createUser.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView).offset(20)
        }
        
        let username = usernameTextField
        usernameTextField.placeholder = "Username"
        usernameTextField.autocorrectionType = .no
        contentView.addSubview(username)
        username.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.top.equalTo(createUser.snp.bottom).offset(20) // below label1 with margin 20pt
            make.width.equalTo(contentView).multipliedBy(0.8)
        }
        
        let email = emailTextField
        emailTextField.placeholder = "Email"
        emailTextField.autocorrectionType = .no
        emailTextField.textContentType = .emailAddress
        contentView.addSubview(email)
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.width.equalTo(contentView).multipliedBy(0.8)
            make.top.equalTo(username.snp.bottom).offset(20)
        }
        
        let password = passwordTextField
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        contentView.addSubview(password)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.width.equalTo(contentView).multipliedBy(0.8)
            make.top.equalTo(email.snp.bottom).offset(20)
        }
        
        let registerButton = registerButton
        registerButton.createButton(buttonTilte: "Sign Up")
        registerButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        contentView.addSubview(registerButton)
        registerButton.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.width.equalTo(contentView).multipliedBy(0.8)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.bottom.equalTo(contentView).offset(-20)
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


