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
    weak var view: AuthPresenterOutput?
    
    init(
        coordinator: AuthCoordinator,
        authManagement: FirebaseAuthManager
    ) {
        self.coordinator = coordinator
        self.authManagement = authManagement
    }
    
    func signup(email: String, username: String, password: String) {
        authManagement.createUser(withEmail: email, password: password, username: username)
    }

    func viewDidLoad() {
        
        view?.setState(.start)
    
        coordinator.start()
    }
}

