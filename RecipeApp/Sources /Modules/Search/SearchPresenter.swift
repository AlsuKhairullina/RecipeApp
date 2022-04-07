//
//  SearchPresenter.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

class SearchPresenter: PresenterInput {
    
    weak var view: PresenterOutput?
    var coordinator: SearchCoordinator?

    func viewDidLoad() {
        view?.setState(.start)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.coordinator?.start()
        }
    }
}

