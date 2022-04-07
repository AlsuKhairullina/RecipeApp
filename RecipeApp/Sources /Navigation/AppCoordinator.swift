//
//  AppCoordinator.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 25.03.2022.
//

import UIKit
import Firebase

final class AppCoordinator: CoordinatorProtocol {

    enum AppFlow {
        case openAuthScreen
        case openHomeScreen
    }
    
    private lazy var authCoordinator = AuthCoordinator(parentCoordinator: self)
    private lazy var tabBarCoordinator = TabBarCoordinator()
    
    private let window: UIWindow
        
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(with route: AppFlow) {
        switch route {
        case .openAuthScreen:
            setRootViewController(authCoordinator.configureMainController(), duration: 1.0)
        case .openHomeScreen:
            setRootViewController(tabBarCoordinator.configureMainController(), duration: 1.0)
        }
    }
    
    func start() {
        if isLoggedIn() {
            navigate(with: .openHomeScreen)
        } else {
            navigate(with: .openAuthScreen)
        }
    }
    
    func finishAuthFlow() {
        navigate(with: .openHomeScreen)
    }
    
    func setRootViewController(_ vc: UIViewController, duration: TimeInterval) {
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: duration,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
    
    func isLoggedIn() -> Bool {
        Auth.auth().currentUser != nil
    }
}

