//
// ProductDetailsView.swift
// MY-CLOTHINGS
//
// Created by Yasir Rifai on 2024-03-23.
//
import SwiftUI
import Kingfisher

struct ProductDetailsView: View {
    @State var selectedProduct: Product
    @StateObject var productVM: ProductViewModel = ProductViewModel()
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var cartManager: ShoppingCartViewModel
    
    @State private var showToast = false
    @State private var toastMessage = ""
    
    var body: some View {
        ScrollView {
            ProductItemView(product: selectedProduct, cartManager: cartManager, showToast: $showToast, toastMessage: $toastMessage)
                .navigationTitle("Product Details")
                .overlay(
                    VStack {
                        if showToast {
                            ToastView(message: toastMessage)
                        }
                        Spacer()
                    }
                )
                .onChange(of: cartManager.products) { _ in
                    if let index = cartManager.products.firstIndex(where: { $0.id == selectedProduct.id }) {
                        selectedProduct.quantity = cartManager.products[index].quantity
                    }
                }
        }
      
    }
}

struct ProductItemView: View {
    let product: Product // Update to use Product instead of ProductModel
    @ObservedObject var cartManager: ShoppingCartViewModel
    @Binding var showToast: Bool
    @Binding var toastMessage: String
    
    @State private var selectedSize = "Select a size"
    @State private var selectedColor = "Select a color"
    @State private var selectedQuantity = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProductImageView(imageUrl: URL(string: product.images))
                .frame(height: 200)
                .cornerRadius(15)
            
            VStack(alignment: .center, spacing: 10) {
                Text(product.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("$\( product.pricePerQty).00")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Description")
                    .font(.headline)
                    .padding(.bottom, 5)
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                if product.sizes.count > 0 {
                    Text("Select Size")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    Picker("Size", selection: $selectedSize) {
                        ForEach(product.sizes, id: \.self) { size in
                            Text(size).tag(size)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)
                } else {
                    Text("No sizes available")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
            }
            
            Divider()
            
            Button(action: {
                print("Adding product: \(product.name)")
                cartManager.addToCart(product: product)
                showToast = true // Show toast
                toastMessage = "\(product.name) was added to cart successfully"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showToast = false // Hide toast after 2 seconds
                }
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}


struct ProductImageView: View {
    let imageUrl: URL?
    
    var body: some View {
        Group {
            if let imageUrl = imageUrl {
                KFImage.url(imageUrl)
                    .resizable()
                    .scaledToFit()
                    
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(15)
            }
        }
    }
}


struct ToastView: View {
    var message: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Text(message)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.9))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .animation(.easeInOut)
                .frame(width: geometry.size.width, height: geometry.size.height)
                Spacer()
            }
        }
    }
}
