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
        
        let loginLabel = UILabel()
        loginLabel.text = "Log In"
        loginLabel.font = .boldSystemFont(ofSize: 30)
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
        
        let emailTextField = customUITextField()
        emailTextField.placeholder = "Email"
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(loginLabel).inset(60)
        }
        
        let passwordTextField = customUITextField()
        passwordTextField.placeholder = "Password"
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(emailTextField).inset(60)
        }
        
        let loginButton = UIButton()
        loginButton.createButton(buttonTilte: "Sign Up")
        loginButton.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.top.equalTo(passwordTextField).inset(60)
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

