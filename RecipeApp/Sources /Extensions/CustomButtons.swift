//
//  CustomButtons.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 08.04.2022.
//

import UIKit

extension UIButton {
    func createRectangleButton(buttonTilte: String, font: String) {
        let button = self // changes made here
        button.setTitle(buttonTilte, for: .normal)
        button.titleLabel?.font = UIFont(name: font, size: 20)
        button.backgroundColor = UIColor.customGreen
        button.tintColor = UIColor.customWhite
       }
}
