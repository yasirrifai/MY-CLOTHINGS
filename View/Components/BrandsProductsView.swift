//
//  BrandsProductsView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-25.
//

import SwiftUI
struct BrandsProductsView: View {
    let brand: BrandModel
    let productVM: ProductViewModel
    @State private var selectedProduct: Product?

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(productVM.productList.filter { $0.brand == brand.brandName }) { product in
                    ProductRowView(product: product)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(brand.brandName)
        .sheet(item: $selectedProduct) { product in
                    ProductDetailsView(selectedProduct: product) 
                }
        .onAppear {
                    productVM.loadProducts() // Load products for the selected brand
                }
    }
}


struct ProductRowView: View {
    let product: Product
    @State private var isDetailViewActive = false // State variable to control navigation
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .bottomLeading) {
                ProductImageView(imageUrl: URL(string: product.images))
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Text("$\(String( product.pricePerQty)).00")
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
                ProductDetailsView(selectedProduct: product)
                
            }
        }
        .padding(.horizontal)
    }
}

struct BrandsProductsView_Previews: PreviewProvider {
    static var previews: some View {
        let productVM = ProductViewModel()
        let selectedBrand = clothingBrands[0]
        return BrandsProductsView(brand: selectedBrand, productVM: productVM)
                    .environmentObject(ShoppingCartViewModel())
    }
}
