//
//  HomePresenter.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

class HomePresenter: HomePresenterInput {
    
    weak var view: HomePresenterOutput?
    var coordinator: HomeCoordinator?

    func viewDidLoad() {
        view?.setState(.start)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.coordinator?.start()
        }
    }
    
}
