//
//  HomeCoordinator.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    
    var parentCoordinator: TabBarCoordinator
    
    enum HomeFlow {
        case home
    }
    
    init(parentCoordinator: TabBarCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    private let navigationController = UINavigationController()
    
    func navigate(with route: HomeFlow) {
        switch route {
        case .home:
            let presenter = HomePresenter(coordinator: self)
            let vc = HomeViewController()
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        navigate(with: .home)
    }
    
    func configureMainController() -> UIViewController {
        navigate(with: .home)
        return navigationController
    }

}

