//
//  HomeViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Internal Properties

    var presenter: HomePresenterInput?
    var coordinator: HomeCoordinator?

    // MARK: - Private Properties

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .blue

        title = "Стартовая страница #1"
    }
}

extension HomeViewController: HomePresenterOutput {

    func setState(_ state: HomeState) {
        switch state {
        case .done:
            self.view.backgroundColor = .green
        case .start:
            self.view.backgroundColor = .systemTeal
        case .failure:
            self.view.backgroundColor = .red
        }
    }

}
