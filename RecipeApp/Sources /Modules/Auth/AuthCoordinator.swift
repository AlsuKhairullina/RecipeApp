//
//  AuthCoordinator.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

final class AuthCoordinator: CoordinatorProtocol {
    
    var parentCoordinator: AppCoordinator
    
    enum Route {
        case onboarding
        case signUp
        case logIn
    }
    
    private let navigationController = UINavigationController()
    
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
            let vc = SignUpViewController()
            let presenter = SignUpPresenter(coordinator: self, authManagement: FirebaseAuthManager())
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        case .logIn:
            let vc = LogInViewController()
            let presenter = LoginPresenter(coordinator: self, authManager: FirebaseAuthManager())
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        }
    }

    func start() {
        navigate(with: .signUp)
    }
    
    func finishAuth() {
        parentCoordinator.finishAuthFlow()
    }
    
    func configureMainController() -> UIViewController {
        navigate(with: .onboarding)
        return navigationController
    }
    
}

