//
//  LogInViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//
import UIKit
import SnapKit

class LogInViewController: UIViewController {

    var presenter: LogInPresenterInput?
    
    private lazy var loginLabel = UILabel()
    private lazy var passwordTextField = UITextField()
    private lazy var emailTextField = UITextField()
    private lazy var loginButton = UIButton()

    override func viewDidLoad() {
        
        presenter?.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        
        view.backgroundColor = .white
        
        let loginLabel = loginLabel
        loginLabel.text = "Log In"
        loginLabel.font = .boldSystemFont(ofSize: 30)
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(80)
        }
        
        let emailTextField = RoundedTextField()
        emailTextField.placeholder = "Email"
        emailTextField.autocorrectionType = .no
        emailTextField.textContentType = .emailAddress
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(loginLabel.snp.bottom).offset(20)
        }
        
        let passwordTextField = RoundedTextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
        }
        
        let loginButton = loginButton
        loginButton.createButton(buttonTilte: "Log In")
        loginButton.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
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
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Invalid values", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}

