//
//  BrandsView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-17.
//
import SwiftUI

import SwiftUI

struct BrandsCardView: View {
    @EnvironmentObject var cartManager: ShoppingCartViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Collections of Our **Brands**")
                    .font(.system(size: 30))
                    .padding(.trailing)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(clothingBrands) { brand in
                        NavigationLink(destination: BrandsProductsView(brand: brand, products: productList.filter { $0.brand == brand.brandName })) {
                            BrandCardView(brand: brand)
                        }
                        .buttonStyle(PlainButtonStyle()) 
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 20)
            }
        }
        .navigationTitle("Brands")
    }
}

struct BrandCardView: View {
    var brand: BrandModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(height: 200)
            
            VStack(alignment: .leading) {
                Text(brand.brandName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                Spacer()
                
                Image(brand.brandImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(Circle())
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
        }
        .cornerRadius(20)
     
    }
}

struct BrandsCardView_Previews: PreviewProvider {
    static var previews: some View {
        BrandsCardView()
            .environmentObject(ShoppingCartViewModel())
    }
}
