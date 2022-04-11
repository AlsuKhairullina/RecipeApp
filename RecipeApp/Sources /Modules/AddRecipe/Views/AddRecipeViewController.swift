//
//  AddRecipeViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 27.03.2022.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    var presenter: AddRecipePresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        
        view.backgroundColor = .customWhite
        
        let yourFeedLabel = UILabel()
        yourFeedLabel.text = "Post your recipe"
        yourFeedLabel.font = UIFont.boldSystemFont(ofSize: 30)
        yourFeedLabel.textColor = .customGreen
        view.addSubview(yourFeedLabel)
        yourFeedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(80)
        }
        
        let nameTextField = customUITextField()
        nameTextField.placeholder = "Name of your dish"
        nameTextField.backgroundColor = .none
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(yourFeedLabel).inset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(330)
        }
        
        let descriptionTextField = UITextView()
        descriptionTextField.backgroundColor = .none
        descriptionTextField.layer.borderWidth = 1.0
        descriptionTextField.layer.cornerRadius = 20
        descriptionTextField.layer.borderColor = UIColor.customGray.cgColor
        view.addSubview(descriptionTextField)
        descriptionTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField).inset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(330)
            make.height.equalTo(200)
        }
    }
}

extension AddRecipeViewController: AddRecipePresenterOutput {

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

