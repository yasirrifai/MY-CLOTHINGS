//
//  ProductCategoryView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//
import SwiftUI

struct ProductCategoryView: View {
    @Binding var selectedCategory: String
    @EnvironmentObject var cartManager: ShoppingCartViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(productCategoryList, id: \.id) { category in
                    Button(action: {
                        selectedCategory = category.title 
                    }) {
                        VStack(spacing: 5) {
                            Image(category.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(selectedCategory == category.title ? .white : .black)
                                .padding(8)
                                .clipShape(Circle())
                                .background(selectedCategory == category.title ? Color.black : Color.white)
                                .clipShape(Circle())
                            
                            Text(category.title)
                                .font(.caption)
                                .foregroundColor(selectedCategory == category.title ? .black : .gray)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(selectedCategory == category.title ? Color.cyan.opacity(0.4) : Color.white)
                        .cornerRadius(20)
                        .shadow(color: selectedCategory == category.title ? Color.black.opacity(0.3) : Color.clear, radius: 3, x: 0, y: 1)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

