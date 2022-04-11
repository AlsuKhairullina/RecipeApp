//
//  CustomButtons.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 08.04.2022.
//

import UIKit

extension UIButton {
    func createButton(buttonTilte: String) {
        let button = self // changes made here
        button.setTitle(buttonTilte, for: .normal)
        button.backgroundColor = UIColor.customGreen
        button.tintColor = UIColor.customWhite
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
       }
}
