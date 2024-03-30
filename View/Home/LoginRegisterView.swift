//
//  LoginRegisterView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-26.
//
//
//  LoginRegisterView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-26.
//
import SwiftUI

struct LoginRegisterView: View {
    @Binding var isLoggedIn: Bool
    @StateObject var wishListViewModel = WishListViewModel()
    
    @State private var isLoginSelected = true
    @State private var showAlert = false
    @State private var navigateToCheckout = false
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack(spacing: 20) {
            closeButton()
            
            Text(isLoginSelected ? "Login" : "Register")
                .font(.title)
                .fontWeight(.bold)
            
            emailTextField()
            passwordSecureField()
            loginOrRegisterOptions()
            loginOrRegisterButton()
        }
        .background(Color.gray.opacity(0.1))
        .navigationTitle("Shopping Cart")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
        .fullScreenCover(isPresented: $navigateToCheckout) {
            CheckoutView(products: productList)
        }
    }
    
    private func closeButton() -> some View {
        HStack {
            Spacer()
            Button(action: {
                mode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.title2)
            }
            .padding()
        }
        .padding(.vertical)
    }
    
    private func emailTextField() -> some View {
        TextField("Username", text: $wishListViewModel.username)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal)
            .textInputAutocapitalization(.never)
    }
    
    private func passwordSecureField() -> some View {
        SecureField("Password", text: $wishListViewModel.password)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal)
    }
    
    private func loginOption() -> some View {
        Text("Are you a new user? click here to  Register")
            .foregroundColor(.blue)
            .font(.footnote) 
            .onTapGesture {
                isLoginSelected = true
            }
    }
    
    private func registerOption() -> some View {
        Text("Existing user? Click here to Login")
            .foregroundColor(.green)
            .font(.footnote)
            .onTapGesture {
                isLoginSelected = false
            }
    }
    
    
    private func loginOrRegisterOptions() -> some View {
        HStack(spacing: 20) {
            Text(isLoginSelected ? "Are you a new user? Click here to Register" : "Existing user? Click here to Login")
                .foregroundColor(isLoginSelected ? .blue : .green)
                .font(.footnote)
                .onTapGesture {
                    isLoginSelected.toggle()
                }
        }
        .padding(.horizontal)
    }
    
    private func loginOrRegisterButton() -> some View {
        Button(action: {
            guard !wishListViewModel.username.isEmpty else {
                showAlert = true
                return
            }
            guard !wishListViewModel.password.isEmpty else {
                showAlert = true
                return
            }
            wishListViewModel.validateUser()
            if wishListViewModel.succes {
                showAlert = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    navigateToCheckout = true
                }
            } else {
                showAlert = true
            }
        }) {
            Text(isLoginSelected ? "Login" : "Register")
                .padding()
                .foregroundColor(.white)
                .background(isLoginSelected ? Color.blue : Color.green)
                .cornerRadius(10)
        }
        .padding(.horizontal)
        .alert(isPresented: $showAlert) {
            if wishListViewModel.succes {
                return Alert(title: Text("Success"), message: Text(isLoginSelected ? "Login successful!" : "Registration successful!"), dismissButton: .default(Text("OK")))
            } else {
                return Alert(title: Text("Error"), message: Text("Invalid username or password"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
}
