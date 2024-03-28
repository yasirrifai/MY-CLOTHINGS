//
//  HomeView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//
import SwiftUI

struct HomeView: View {
    @State private var showShoppingCart = false
    @State private var selectedCategory: String = "All"
    @StateObject var cartManager = ShoppingCartViewModel()
    @State var allProducts: [ProductModel] = productList
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Biggest fashion store made **Online**")
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Button(action: {
                            showShoppingCart.toggle()
                        }) {
                            ZStack {
                                Image(systemName: "cart")
                                    .font(.title)
                                    .foregroundColor(.black)
                                
                                if cartManager.products.count > 0 {
                                    Text("\(cartManager.products.count)")
                                        .foregroundColor(.white)
                                        .font(.caption)
                                        .padding(6)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 10, y: -10)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Text("latest collection in the town... ")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .italic()
                        .foregroundColor(.gray)
                        .padding(.horizontal)
          
                    ProductCategoryView(selectedCategory: $selectedCategory)
                        .environmentObject(cartManager)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(filteredProducts, id: \.id) { product in
                                NavigationLink(destination: ProductDetailsView(product: product).environmentObject(cartManager)) {
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.top, 20)
            }
        }
        .sheet(isPresented: $showShoppingCart) {
            ShoppingCartView()
                .environmentObject(cartManager) 
        }
    }
    
    var filteredProducts: [ProductModel] {
        if selectedCategory == "All" {
            return allProducts
        } else {
            return allProducts.filter { $0.category == selectedCategory }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ShoppingCartViewModel())
    }
}
