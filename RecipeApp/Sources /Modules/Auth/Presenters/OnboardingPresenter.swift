//
//  OnboardingPresenter.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 06.04.2022.
//

import UIKit

class OnboardingPresenter: OnboardingPresenterInput {
    
    weak var view: OnboardingPresenterOutput?
    private var coordinator: AuthCoordinator
    
    init(
        coordinator: AuthCoordinator)
    {
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        view?.setState(.start)
    }
    
    func goToSignUpScreen() {
        coordinator.navigate(with: .signUp)
    }
    
    func goToLogInScreen() {
        coordinator.navigate(with: .logIn)
    }
}
