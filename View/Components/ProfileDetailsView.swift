//
// ProfileDetailsView.swift
// MY-CLOTHINGS
//
// Created by Yasir Rifai on 2024-03-18.
//
import SwiftUI

struct ProfileDetailsView: View {
    @State private var editProfileButtonTapped = false
    
    // Replace these with your actual data
    let firstName = "Danilo"
    let lastName = "Tanic"
    let email = "danilo@uscreen.tv"
    let contactNumber = "+1234567890"
    let addressLine1 = "1 Infinite Loop"
    let addressLine2 = "Apt. 100"
    let city = "Cupertino"
    let postalCode = "95014"
    let country = "United States"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("MY")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                Text("Profile Details")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 20) {
                    RoundedTextField(value: firstName, placeholder: "First Name")
                    RoundedTextField(value: lastName, placeholder: "Last Name")
                }
                
                RoundedTextField(value: email, placeholder: "Email")
                RoundedTextField(value: contactNumber, placeholder: "Contact Number")
                
                Text("Addresses")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 20) {
                    RoundedTextField(value: addressLine1, placeholder: "Address Line 1")
                    RoundedTextField(value: addressLine2, placeholder: "Address Line 2")
                }
                
                HStack(spacing: 20) {
                    RoundedTextField(value: city, placeholder: "City")
                    RoundedTextField(value: postalCode, placeholder: "Postal Code")
                }
                
                RoundedTextField(value: country, placeholder: "Country")
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Profile Details")
    }
}

struct RoundedTextField: View {
    var value: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: .constant(value))
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.4), lineWidth: 1))
            .padding(.horizontal)
    }
}

struct ProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsView()
    }
}
