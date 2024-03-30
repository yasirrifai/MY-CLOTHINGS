//
//  BrandsProductsView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-25.
//

import SwiftUI
struct BrandsProductsView: View {
    let brand: BrandModel
    let products: [ProductModel]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(products) { product in
                    ProductRowView(product: product)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(brand.brandName)
    }
}

struct ProductRowView: View {
    let product: ProductModel
    @State private var isDetailViewActive = false // State variable to control navigation
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .bottomLeading) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                    
                }
                .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(15)
            
            Button(action: {
                isDetailViewActive = true
            }) {
                Text("View Details")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .sheet(isPresented: $isDetailViewActive) {
                ProductDetailsView(product: product)
                
            }
        }
        .padding(.horizontal)
    }
}

struct BrandsProductsView_Previews: PreviewProvider {
    static var previews: some View {
        let selectedBrand = clothingBrands[0] 
        let selectedProducts = productList.filter { $0.brand == selectedBrand.brandName }
        return BrandsProductsView(brand: selectedBrand, products: selectedProducts)
            .environmentObject(ShoppingCartViewModel())
    }
}
