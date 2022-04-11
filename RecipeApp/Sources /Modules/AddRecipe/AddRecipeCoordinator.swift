//
//  AddRecipeCoordinator.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

final class AddRecipeCoordinator: CoordinatorProtocol {
    
    var parentCoordinator: TabBarCoordinator
    
    init(parentCoordinator: TabBarCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    private let navigationController = UINavigationController()
    
    enum AddRecipeFlow {
        case addRecipe
    }
    
    func navigate(with route: AddRecipeFlow) {
        switch route {
        case .addRecipe:
            let presenter = AddRecipePresenter(coordinator: self)
            let vc = AddRecipeViewController()
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        navigate(with: .addRecipe)
    }

    func configureMainController() -> UIViewController {
        navigate(with: .addRecipe)
        return navigationController
    }

}
