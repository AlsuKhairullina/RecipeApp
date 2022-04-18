//
//  AuthCoordinator.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

final class AuthCoordinator: CoordinatorProtocol {
    
    private var parentCoordinator: AppCoordinator
    private let navigationController = UINavigationController()
    
    enum Route {
        case onboarding
        case signUp
        case logIn
    }
    
    init(parentCoordinator: AppCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    func navigate(with route: Route) {
        switch route {
        case .onboarding:
            let presenter = OnboardingPresenter(coordinator: self)
            let vc = OnboardingViewController()
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        case .signUp:
            let presenter = SignUpPresenter(coordinator: self, authManagement: FirebaseAuthManager(), validationService: ValiadationService())
            let vc = SignUpViewController()
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        case .logIn:
            let presenter = LoginPresenter(coordinator: self, authManager: FirebaseAuthManager(), validationService: ValiadationService())
            let vc = LogInViewController()
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        }
    }

    func start() {
        navigate(with: .onboarding)
    }
    
    func finishAuth() {
        parentCoordinator.finishAuthFlow()
    }
    
    func configureMainController() -> UIViewController {
        navigate(with: .onboarding)
        return navigationController
    }
    
}

