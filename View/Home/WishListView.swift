//
//  WishListView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//

import SwiftUI

struct WishListView: View {
    @State private var emailOrPhone: String = ""
    @State private var showRegisterView: Bool = false
    @EnvironmentObject var cartManager : ShoppingCartViewModel
    
    var body: some View {
        VStack {
            HStack{
                Text("Enter Your Email or Phone Number")
                    .font(.system(size: 30))
                    .padding(.trailing)
                
                Spacer()
            }
            HStack{
                Text("Subscribe for more offers and deals at *MYCLOTHINGS*")
                    .font(.system(size: 12))
                    .padding(.trailing)
                
                Spacer()
            }
            
            
            HStack{
                TextField("Enter email / phone", text: $emailOrPhone)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
            }
            VStack{
                
                
                Button(action: {
                    
                    
                }) {
                    Text("SUBSCRIBE")
                        .foregroundColor(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                .padding()
                
            }
            Spacer()
            
        } .padding(30)
        
    }
    
    
}

struct RegisterView: View {
    var body: some View {
        Text("Register View")
            .font(.largeTitle)
            .padding()
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
            .environmentObject(ShoppingCartViewModel())
    }
}
