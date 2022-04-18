//
//  AddRecipeCoordinator.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

final class AddRecipeCoordinator: CoordinatorProtocol {
    
    var parentCoordinator: TabBarCoordinator
    private let navigationController = UINavigationController()
    
    init(parentCoordinator: TabBarCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    // передача модели в координаторе
    
    enum AddRecipeFlow {
        case addNamePhoto
        case addDescription

    }
    
    func navigate(with route: AddRecipeFlow) {
        switch route {
        case .addNamePhoto:
            let presenter = AddRecipePresenter(coordinator: self)
            let vc = AddRecipeViewController()
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        case .addDescription:
            let presenter = AddDescriptionPresenter(coordinator: self)
            let vc = AddDescriptionViewController()
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        navigate(with: .addNamePhoto)
    }

    func configureMainController() -> UIViewController {
        navigate(with: .addNamePhoto)
        return navigationController
    }

}
