//
//  LoginPresenter.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 03.04.2022.
//

import UIKit

class LoginPresenter: LogInPresenterInput {
    
    var coordinator: AuthCoordinator
    var authManager: FirebaseAuthManager
    var validationService: ValiadationService
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
        authManager.logUserIn(withEmail: email, password: password)
        coordinator.finishAuth()
    }
}
