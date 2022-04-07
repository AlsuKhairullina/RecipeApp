//
//  ProfileCoordinator.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

final class ProfileCoordinator: CoordinatorProtocol {
    
    var parentCoordinator: TabBarCoordinator?
    
    private let navigationController = UINavigationController()
    
    enum Route {
        case main
    }
    
    func start() {
        print()
    }
    
    func navigate(with route: Route) {
        print()
    }
    
    func configureMainController() -> UIViewController {
        navigate(with: .main)
        return navigationController
    }

}
