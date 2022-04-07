//
//  AuthState.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 27.03.2022.
//

import UIKit

enum AuthState {
    case done
    case start
    case failure(message: String)
}
