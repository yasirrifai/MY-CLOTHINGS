//
//  ProfileAboutView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-24.
//
import SwiftUI

struct ProfileAboutView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Text("About My-Clothings")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text("Version: 1.0.0")
                .foregroundColor(.gray)
                .padding(.bottom, 10)
            
            Text("My-Clothings is your ultimate destination for trendy and fashionable clothing. We offer a wide range of products, including apparel, accessories, and footwear, curated from top brands around the world.")
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Contact Details:")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("Email: info@myclothings.com")
                    .foregroundColor(.gray)
                
                Text("Phone: +1 (123) 456-7890")
                    .foregroundColor(.gray)
            }
            .padding(.top, 20)
            
            Spacer()
            
            Button("Back to Account") {
                presentationMode.wrappedValue.dismiss() 
                
            }
        }
        .padding()
    }
}

struct ProfileAboutView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAboutView()
    }
}
