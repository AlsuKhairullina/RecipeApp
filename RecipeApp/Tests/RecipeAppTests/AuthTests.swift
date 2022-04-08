//
//  SignUpTests.swift
//  RecipeAppTests
//
//  Created by Алсу Хайруллина on 08.04.2022.
//

import XCTest
@testable import RecipeApp

class AuthTests: XCTestCase {
    
    var valueValidator: ValiadationService!
    var authManager: FirebaseAuthManager!
    
    override func setUpWithError() throws {
        valueValidator = ValiadationService()
        authManager = FirebaseAuthManager()
    }
    
    override func tearDownWithError() throws {
        valueValidator = nil
        authManager = nil
    }
    
    func testIsLoggedInTrue() throws {
        // Given
        let isLogged = true
        
        //When
        let result = authManager.isLoggedIn()
        
        //Then
        XCTAssertEqual(result, isLogged)
    }
    
    func testIsLoggedInFalse() throws {
        // Given
        let isLogged = false
        
        //When
        let result = authManager.isLoggedIn()
        
        //Then
        XCTAssertNotEqual(result, isLogged)
    }

    func testSignUpValidationCorrect() throws {
        
        // Given
        let email: String = "testemail@test.com"
        let password: String = "Testpassword!"
        let expectedResult = true
    
        // When
        let validatedEmail = valueValidator.isValidEmail(email: email)
        let validatedPassword =  valueValidator.isValidPassword(password: password)
        
        // Then
        XCTAssertEqual(validatedEmail, expectedResult)
        XCTAssertEqual(validatedPassword, expectedResult)
        
    }
    
    func testSignUpValidationIncorrect() throws {
        
        // Given
        let email: String = "somerandomstring"
        let password: String = "somerandompassword"
        let expectedResult = false
    
        // When
        let validatedEmail = valueValidator.isValidEmail(email: email)
        let validatedPassword =  valueValidator.isValidPassword(password: password)
        
        // Then
        XCTAssertEqual(validatedEmail, expectedResult)
        XCTAssertEqual(validatedPassword, expectedResult)
        
    }
    
    func testSigUpValidationWithEmptyValues() throws {
        
        //Given
        let email = String()
        let password = String()
        let expectedResult = true
        
        //When
        let validatedEmail = valueValidator.isValidEmail(email: email)
        let validatedPassword = valueValidator.isValidPassword(password: password)
        
        //Then
        XCTAssertNotEqual(expectedResult, validatedEmail)
        XCTAssertNotEqual(expectedResult, validatedPassword)
    
    }
    
}
