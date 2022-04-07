//
//  LogInViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//
import UIKit
import SnapKit

class LogInViewController: UIViewController {

    // MARK: - Internal Properties

    var presenter: LogInPresenterInput?
    
    // MARK: - Private Properties
    
    lazy var passwordTextField = UITextField()
    lazy var emailTextField = UITextField()

    override func viewDidLoad() {
        
        presenter?.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = .white
        
        let email = emailTextField
        emailTextField.borderStyle = .bezel
        emailTextField.placeholder = "email"
        view.addSubview(email)
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(200)
    }
        
        let password = passwordTextField
        passwordTextField.borderStyle = .bezel
        passwordTextField.placeholder = "password"
        view.addSubview(password)
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(emailTextField).inset(50)
        }
        
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(red: 109/255, green: 172/255, blue: 186/255, alpha: 1)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Mustica Pro", size: 20)
        loginButton.layer.cornerRadius = 20
        loginButton.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(passwordTextField).inset(50)
            make.height.equalTo(40)
        }
    }
    
    @objc func handleLogIn() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
    
        presenter?.login(email: email, password: password)
    }
}

// MARK: - SuggestionPresenterOutput

extension LogInViewController: AuthPresenterOutput {
   
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

