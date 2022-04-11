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
        
        view.backgroundColor = .customWhite
        
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Cooking was never that easy"
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textColor = .customGreen
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        welcomeLabel.textAlignment = .center
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        let launchImage = UIImageView()
        launchImage.image = UIImage(named: "launchPic")
        view.addSubview(launchImage)
        launchImage.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel).inset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(400)
        }
        
        let loginButton = UIButton()
        loginButton.createButton(buttonTilte: "Log In")
        loginButton.addTarget(self, action: #selector(goToLogIn), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.top.equalTo(launchImage).inset(450)
            make.height.equalTo(40)
        }
        
        let createUserButton = UIButton()
        createUserButton.createButton(buttonTilte: "Create an account")
        createUserButton.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        view.addSubview(createUserButton)
        createUserButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.top.equalTo(loginButton).inset(50)
            make.height.equalTo(40)
        }
    }
    
    @objc private func goToLogIn() {
        presenter?.goToLogInScreen()
    }
    
    @objc private func goToSignUp() {
        presenter?.goToSignUpScreen()
    }
}

extension OnboardingViewController: OnboardingPresenterOutput {
   
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

