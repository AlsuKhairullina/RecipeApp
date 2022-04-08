//
//  SignUpPresenter.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 27.03.2022.
//


import Foundation

class SignUpPresenter: SignUpPresenterInput {
    
    var coordinator: AuthCoordinator
    var authManagement: FirebaseAuthManager
    var validationService: ValiadationService
    weak var view: AuthPresenterOutput?
    
    init(
        coordinator: AuthCoordinator,
        authManagement: FirebaseAuthManager,
        validationService: ValiadationService
    ) {
        self.coordinator = coordinator
        self.authManagement = authManagement
        self.validationService = validationService
    }
    
    func signup(email: String, username: String, password: String) {
        if validationService.isValidPassword(password: password) && validationService.isValidEmail(email: email) == true {
            authManagement.createUser(withEmail: email, password: password, username: username)
            coordinator.finishAuth()
        } else {
            view?.showAlert()
        }
    }

    func viewDidLoad() {
        
        view?.setState(.start)
    }
}

