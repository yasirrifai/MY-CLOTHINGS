//
//  ShoppingCartView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//
import SwiftUI
struct ShoppingCartView: View {
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var cartManager: ShoppingCartViewModel
    @State private var navigateToCheckout = false
    @State private var isLoggedIn = false
    @State private var showLoginRegisterView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
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
                    
                    ForEach(cartManager.products) { product in
                        CartProductRow(product: product, cartManager: _cartManager)
                    }
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("Delivery Fee")
                            Spacer()
                            Text("Free")
                                .font(.headline)
                        }
                        Divider()
                        HStack {
                            Text("Total Amount")
                            Spacer()
                            Text("$\(String(format: "%.2f", cartManager.total))")
                                .font(.headline)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                    if cartManager.products.count > 0 {
                        Button(action: {
                            cartManager.clearCart()
                        }) {
                            Text("Clear Cart")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    
                    Button(action: {
                        if cartManager.products.count > 0 {
                            if isLoggedIn {
                                navigateToCheckout = true
                            } else {
                                showLoginRegisterView = true 
                            }
                        }
                    }) {
                        Text("Checkout")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                .padding(.horizontal)
            }
            .background(Color.gray.opacity(0.1))
            .navigationTitle("Shopping Cart")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.black)
        .sheet(isPresented: $navigateToCheckout) {
            CheckoutView(products: cartManager.products)
                .environmentObject(cartManager)
                .environmentObject(WalletManager())
        }
        .sheet(isPresented: $showLoginRegisterView) {
            LoginRegisterView(isLoggedIn: $isLoggedIn)
                .environmentObject(cartManager)
        }
    }
}
struct CartProductRow: View {
    let product: ProductModel
    @EnvironmentObject var cartManager: ShoppingCartViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
                .padding(8)
                .background(Color.gray.opacity(0.1))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)
                    .fontWeight(.bold)
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                
                
                HStack(spacing: 10) {
                    Button(action: {
                        cartManager.removeFromCart(product: product)
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.black)
                    }
                    Text("\(product.quantity)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Button(action: {
                        cartManager.addToCart(product: product)
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.black)
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}


struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView()
            .environmentObject(ShoppingCartViewModel())
    }
}
