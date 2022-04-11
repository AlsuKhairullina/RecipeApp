//
//  AddRecipeProtocol.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 09.04.2022.
//

import UIKit

protocol AddRecipePresenterInput: AnyObject {
    func viewDidLoad()
}

protocol AddRecipePresenterOutput: UIViewController {
    func setState(_: AddRecipeState)
}
