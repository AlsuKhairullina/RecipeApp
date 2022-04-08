//
//  AuthProtocols.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 27.03.2022.
//

import UIKit

protocol LogInPresenterInput: AnyObject {
    func viewDidLoad()
    func login(email: String, password: String)
}

protocol SignUpPresenterInput: AnyObject {
    func viewDidLoad()
    func signup(email: String, username: String, password: String)
}

protocol OnboardingPresenterInput: AnyObject {
    func viewDidLoad()
    func goToLogInScreen()
    func goToSignUpScreen()
}

protocol AuthPresenterOutput: AnyObject {
    func setState(_: AuthState)
    func showAlert()
}

protocol OnboardingPresenterOutput: AnyObject {
    func setState(_: AuthState)
}



