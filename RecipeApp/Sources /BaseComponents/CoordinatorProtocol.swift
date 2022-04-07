//
//  CoordinatorProtocol.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 25.03.2022.
//

import UIKit

protocol CoordinatorProtocol {
    associatedtype Route
    
    func navigate(with route: Route)
    func configureMainController() -> UIViewController
}

extension CoordinatorProtocol {
    
    func configureMainController() -> UIViewController {
        assertionFailure("Дефолтная реализация не должна использоваться")
        return UIViewController()
    }
}






