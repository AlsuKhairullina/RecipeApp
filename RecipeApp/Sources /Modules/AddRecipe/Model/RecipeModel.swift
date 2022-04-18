//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 14.04.2022.
//

import UIKit

struct Recipe {
    var name: String
    var photo: UIImage
    var description: String
    var ingridients: [Ingrident]
}

struct Ingrident {
    var name: String
    var unit: Units
}

enum Units {
    case tsp
    case tbs
    case cup
    case ml
    case l
    case g
    case kg
    case mg
}


