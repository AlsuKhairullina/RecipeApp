//
//  OnboardingViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 03.04.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var presenter: OnboardingPresenterInput?
    
    private lazy var welcomeLabel = UILabel()
    private lazy var launchImage = UIImageView()
    private lazy var loginButton = UIButton()
    private lazy var createUserButton = UIButton()

    override func viewDidLoad() {
        
        presenter?.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        
        view.backgroundColor = .customWhite
        
        let welcomeLabel = welcomeLabel
        welcomeLabel.text = "Cooking was never that easy"
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textColor = .customGreen
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        welcomeLabel.textAlignment = .center
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.lessThanOrEqualToSuperview().inset(100)
        }
        
        let launchImage = launchImage
        launchImage.image = UIImage(named: "launchPic")
        launchImage.contentMode = .scaleAspectFit
        view.addSubview(launchImage)
        launchImage.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(welcomeLabel).inset(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(launchImage.snp.width).multipliedBy(1.0/1.0)
        }
        
        
        let loginButton = loginButton
        loginButton.createButton(buttonTilte: "Log In")
        loginButton.addTarget(self, action: #selector(goToLogIn), for: .touchUpInside)
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
            make.top.greaterThanOrEqualTo(launchImage.snp.bottom).offset(20)
        }
        
        
        let createUserButton = createUserButton
        createUserButton.createButton(buttonTilte: "Create an account")
        createUserButton.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        view.addSubview(createUserButton)
        createUserButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
            make.top.equalTo(loginButton).inset(50)
            make.bottom.greaterThanOrEqualToSuperview().offset(-50)
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

