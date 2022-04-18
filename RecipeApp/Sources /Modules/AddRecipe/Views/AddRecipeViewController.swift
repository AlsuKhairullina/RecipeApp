//
//  AddRecipeViewController.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 27.03.2022.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    var presenter: AddRecipePresenterInput?
    
    lazy var postLabel = UILabel()
    lazy var nameTextField = RoundedTextField()
    lazy var descriptionTextView = UITextView()
    lazy var nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureView()
    } 
    
    func configureView() {
        
        view.backgroundColor = .customWhite
        
        let postLabel = postLabel
        postLabel.text = "Post your recipe"
        postLabel.font = UIFont.boldSystemFont(ofSize: 30)
        postLabel.textColor = .customGreen
        view.addSubview(postLabel)
        postLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(80)
        }
        
        let nameTextField = nameTextField
        nameTextField.placeholder = "Name of your dish"
        nameTextField.backgroundColor = .none
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(postLabel).inset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(330)
        }
        
        let nextButton = nextButton
        nextButton.createButton(buttonTilte: "Next")
        nextButton.addTarget(self, action: #selector(goNextScreen), for: .touchUpInside)
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.top.equalTo(nameTextField).inset(60)
            make.height.equalTo(40)
        }
    }
    
    @objc private func goNextScreen() {
        presenter?.goNextScreen()
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

