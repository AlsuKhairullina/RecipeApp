//
//  File.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 09.04.2022.
//

import Foundation

class AddRecipePresenter: AddRecipePresenterInput {
    
    weak var view: AddRecipePresenterOutput?
    private var coordinator: AddRecipeCoordinator
    
    init(coordinator: AddRecipeCoordinator) {
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        view?.setState(.start)
    }
    
    func goNextScreen() {
        coordinator.navigate(with: .addDescription)
    }
}
