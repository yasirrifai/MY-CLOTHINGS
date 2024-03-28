//
//  AccountView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//
import SwiftUI

struct AccountView: View {
    @EnvironmentObject var cartManager: ShoppingCartViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("Welcome Yasir Rifai")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                       
                    }) {
                        Image(systemName: "person.circle")
                            .font(.system(size: 60))
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 40) {
                    NavigationLink(destination: EmptyView()) {
                        VStack {
                            Image(systemName: "list.bullet.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.green)
                            Text("Orders")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
              
                    NavigationLink(destination: WalletView()) {
                        VStack {
                            Image(systemName: "wallet.pass.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.blue)
                            Text("Wallet")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        VStack {
                            Image(systemName: "mappin.and.ellipse")
                                .font(.system(size: 40))
                                .foregroundColor(.orange)
                            Text("Track")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                       
                    }
             
                }
                .padding()
                
                Divider()
                    .background(Color.black)
                    .padding(.horizontal, 20)
                
                VStack {
                    NavigationLink(destination: ProfileDetailsView()) {
                        Label("Details", systemImage: "person")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10)
//                    
//                    NavigationLink(destination: ProfilePaymentsView()) {
//                        Label("Payments", systemImage: "creditcard")
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .font(.system(size: 20))
//                            .foregroundColor(.black)
//                    }
//                    .padding(.top, 10)
                    
                    NavigationLink(destination: ProfileSettingsView()) {
                        Label("Settings", systemImage: "gear")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10)
                    
                    NavigationLink(destination: ProfileAboutView()) {
                        Label("About", systemImage: "info.circle")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10)
                }
                .padding()
                Spacer()
                
                Button(action: {
            
                }) {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 50)
                        .foregroundColor(.red)
                        .overlay(Text("Logout").foregroundColor(.white))
                        .padding(.horizontal, 50)
                }
                .padding(.bottom, 20)
            }
                .padding(.vertical)
            .padding(.horizontal)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(ShoppingCartViewModel())
    }
}
