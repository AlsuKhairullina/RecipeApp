//
//  HomeCoordinator.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    
    enum HomeFlow {
        case home
    }
    
    var parentCoordinator: TabBarCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
        
    private let navigationController = UINavigationController()
    
    func navigate(with route: HomeFlow) {
        switch route {
        case .home:
            let vc = HomeViewController()
            vc.view.backgroundColor = .blue
            let presenter = HomePresenter()
            presenter.view = vc
            presenter.coordinator = self
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        navigate(with: .home)
    }
    
    func openBlackScreen(model: String) {
        let vc = UIViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func configureMainController() -> UIViewController {
        navigate(with: .home)
        return navigationController
    }

}

