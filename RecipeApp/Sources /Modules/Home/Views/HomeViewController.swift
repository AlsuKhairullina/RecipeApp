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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        
        view.backgroundColor = .customWhite
        
        let yourFeedLabel = UILabel()
        yourFeedLabel.text = "Your feed"
        yourFeedLabel.font = UIFont.boldSystemFont(ofSize: 30)
        yourFeedLabel.textColor = .customGreen
        view.addSubview(yourFeedLabel)
        yourFeedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(80)
        }
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
