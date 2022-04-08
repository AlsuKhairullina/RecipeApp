//
//  ValidationService.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 08.04.2022.
//

import Foundation

protocol ValidationServiceProtocol: AnyObject {
    
    func isValidEmail(email: String) -> Bool
    func isValidPassword(password: String) -> Bool
}

class ValiadationService: ValidationServiceProtocol {
    
    func isValidEmail(email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
//    - Password length 6 to 16.
//    - One Alphabet in Password.
//    - One Special Character in Password
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,16}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
}
