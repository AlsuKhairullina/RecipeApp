//
//  FIrebaseClient.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 03.04.2022.
//

import UIKit
import Firebase

// протколы добавить 

class FirebaseAuthManager {
    
    func createUser (withEmail email: String, password: String, username: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print ("Failed with error", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = ["email": email, "username": username]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print ("Failed with error", error.localizedDescription)
                    return
                }
                
                print("successufelly signed up")
                
            })
        }
    }

    func logUserIn(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("failed to log in with eror", error.localizedDescription)
                return
            }
            
            print("successufelly logged in")
        }
    }
}


