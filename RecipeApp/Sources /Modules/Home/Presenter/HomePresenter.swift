//
//  HomePresenter.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

class HomePresenter: HomePresenterInput {
    
    weak var view: HomePresenterOutput?
    var coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }

    func viewDidLoad() {
        view?.setState(.start)
    }
    
}
