//
//  PresenterProtocols.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 06.04.2022.
//

import UIKit

protocol PresenterOutput: AnyObject {
    func setState(_: BaseState)
}

protocol PresenterInput: AnyObject {
    func viewDidLoad()
}
