//
//  OnboardingViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 03.04.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var presenter: OnboardingPresenterInput?

    override func viewDidLoad() {
        
        presenter?.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        
        let loginButton = UIButton()
        loginButton.setTitle("log in", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Mustica Pro", size: 20)
        loginButton.addTarget(self, action: #selector(goToLogIn), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalToSuperview().inset(100)
            make.height.equalTo(40)
        }
        
        let signupButton = UIButton()
        signupButton.backgroundColor = .red
        signupButton.setTitle("sign up", for: .normal)
        signupButton.setTitleColor(.black, for: .normal)
        signupButton.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton).inset(50)
        }
    }
    
    @objc private func goToLogIn() {
        presenter?.goToLogInScreen()
    }
    
    @objc private func goToSignUp() {
        presenter?.goToSignUpScreen()
    }
}

extension OnboardingViewController: AuthPresenterOutput {
   
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

