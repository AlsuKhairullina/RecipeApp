//
//  HomeProtocols.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 06.04.2022.
//

import UIKit

protocol HomePresenterInput: AnyObject {
    func viewDidLoad()
}

protocol HomePresenterOutput: UIViewController{
    func setState(_: HomeState)
}
