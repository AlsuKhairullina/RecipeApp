//
//  OnboardingPresenter.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 06.04.2022.
//

import UIKit

class OnboardingPresenter: OnboardingPresenterInput {
    
    weak var view: AuthPresenterOutput?
    var coordinator: AuthCoordinator

    init(
        coordinator: AuthCoordinator)
    {
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        view?.setState(.start)
        coordinator.start()
    }
    
    func goToSignUpScreen() {
        coordinator.navigate(with: .logIn)
    }
    
    func goToLogInScreen() {
        coordinator.navigate(with: .signUp)
    }
}
