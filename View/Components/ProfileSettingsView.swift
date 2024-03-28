//
//  ProfileSettingsView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-18.
//
import SwiftUI

struct ProfileSettingsView: View {
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmNewPassword = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Change Password")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            VStack {
                TextField("Old Password", text: $oldPassword)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.4), lineWidth: 1))
                    .padding(.horizontal)
            }
            
            VStack {
                SecureField("New Password", text: $newPassword)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.4), lineWidth: 1))
                    .padding(.horizontal)
            }
            
            VStack {
                SecureField("Confirm New Password", text: $confirmNewPassword)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.4), lineWidth: 1))
                    .padding(.horizontal)
            }
            
            Button(action: {
            }) {
                Text("Update")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(15)
            }
            .padding(.horizontal)
        }
        .padding()
        .navigationBarTitle("Profile Settings", displayMode: .inline)
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
