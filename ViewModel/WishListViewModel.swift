//
//  WishListViewModel.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-19.
//

import Foundation
import SwiftUI

class WishListViewModel: ObservableObject {
    
    @Published var username : String = ""
    @Published var password : String = ""
    @Published var showError : Bool = false
    @Published var succes : Bool = false
    @Published var errorMessage : String = ""
    
    func validateUser(){
        if username.isEmpty || password.isEmpty{
            showError = true
            errorMessage = "Please enter username and password to continue"
        }
        else if username == "myrifai" && password == "myrifai@123" {
            showError = false
            succes = true
            
        }
        else {
            showError = true
            errorMessage = "Incorrect username and password, please try again"
        }
    }
}
