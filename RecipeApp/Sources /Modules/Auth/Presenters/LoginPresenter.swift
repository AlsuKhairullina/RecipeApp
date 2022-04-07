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
    weak var view: AuthPresenterOutput?
    
    init(
        coordinator: AuthCoordinator,
        authManager: FirebaseAuthManager
    ) {
        self.coordinator = coordinator
        self.authManager = authManager
    }

    func viewDidLoad() {
        
        view?.setState(.start)
        coordinator.start()
    }
    
    func login(email: String, password: String) {
        authManager.logUserIn(withEmail: email, password: password)
    }
}
