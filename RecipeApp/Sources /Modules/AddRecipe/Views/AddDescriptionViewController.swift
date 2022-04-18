//
//  SetUpTitleViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 13.04.2022.
//

import UIKit

class AddDescriptionViewController: UIViewController {
    
    var presenter: AddRecipePresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = .customWhite
    }
}

extension AddDescriptionViewController: AddRecipePresenterOutput {

    func setState(_ state: AddRecipeState) {
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
