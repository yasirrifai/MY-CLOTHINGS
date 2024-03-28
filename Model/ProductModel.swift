//
//  ProductModel.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//

import Foundation
import SwiftUI

struct ProductModel: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageName: String
    let color: String
    let category: String
    let title: String
    let sizes: [String]
    let brand: String
    let description: String
    var quantity: Int 
}

let productList: [ProductModel] = [
    ProductModel(name: "Mens T-Shirt", price: 20, imageName: "img1", color: "blue", category: "Mens", title: "Mens", sizes: ["L","M","S"], brand: "H&M", description: "A comfortable and stylish t-shirt for everyday wear.", quantity: 3),
    ProductModel(name: "Mens Jeans", price: 40, imageName: "img2", color: "white", category: "Mens", title: "Mens", sizes: ["L","M","S"], brand: "H&M", description: "Classic denim jeans that fit perfectly and look great.", quantity: 3),
    ProductModel(name: "Womens Hoodie", price: 60, imageName: "img3", color: "red", category: "Womens", title: "Womens", sizes: ["L","XL","S"], brand: "Forever 21", description: "Stay cozy and stylish with this vibrant red hoodie.", quantity: 3),
    ProductModel(name: "Unisex Sneakers", price: 80, imageName: "img4", color: "green", category: "Unisex", title: "Kids", sizes: ["L","M","S"], brand: "Nike", description: "Sporty and comfortable sneakers for your active lifestyle.", quantity: 3),
    ProductModel(name: "Kids Cap", price: 15, imageName: "img5", color: "brown", category: "Kids", title: "Kids", sizes: ["XL"], brand: "Gap", description: "Complete your child's casual look with this trendy brown cap from Gap.", quantity: 3)
]




struct BrandModel: Identifiable {
    let id = UUID()
    let brandName: String
    let brandImage: String
    let brandColor: Color
}

let clothingBrands: [BrandModel] = [
    BrandModel(brandName: "H&M", brandImage: "hm-logo", brandColor: Color(red: 0.1, green: 0.7, blue: 0.5)),
    BrandModel(brandName: "Forever 21", brandImage: "forever", brandColor: Color(red: 0.8, green: 0.2, blue: 0.9)),
    BrandModel(brandName: "Gap", brandImage: "Gap", brandColor: Color(red: 0.1, green: 0.3, blue: 0.7)),
    BrandModel(brandName: "Uniqlo", brandImage: "Uniqlo", brandColor: Color(red: 0.9, green: 0.8, blue: 0.1)),
    BrandModel(brandName: "Levi's", brandImage: "levis", brandColor: Color(red: 0.2, green: 0.4, blue: 0.6)),
    BrandModel(brandName: "Nike", brandImage: "nike", brandColor: Color(red: 0.9, green: 0.1, blue: 0.1)),
    BrandModel(brandName: "Adidas", brandImage: "adidas-logo-2", brandColor: Color(red: 0.1, green: 0.5, blue: 0.9)),
    BrandModel(brandName: "Under Armour", brandImage: "UA", brandColor: Color(red: 0.3, green: 0.7, blue: 0.2)),
    BrandModel(brandName: "Puma", brandImage: "puma", brandColor: Color(red: 0.9, green: 0.5, blue: 0.2))
]

