//
//  LoginPresenter.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 03.04.2022.
//

import UIKit

class LoginPresenter: LogInPresenterInput {

    private var coordinator: AuthCoordinator
    private var authManager: FirebaseAuthManager
    private var validationService: ValiadationService
    weak var view: AuthPresenterOutput?
    
    init(
        coordinator: AuthCoordinator,
        authManager: FirebaseAuthManager,
        validationService: ValiadationService
    ) {
        self.coordinator = coordinator
        self.authManager = authManager
        self.validationService = validationService
    }
    
    func viewDidLoad() {
        view?.setState(.start)
    }
    
    func login(email: String, password: String) {
        if validationService.isValidPassword(password: password) && validationService.isValidEmail(email: email) == true {
            authManager.logUserIn(withEmail: email, password: password)
            coordinator.finishAuth()
        } else {
            view?.showAlert()
        }
    }
}
