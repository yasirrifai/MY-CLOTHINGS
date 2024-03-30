//
//  ProductCategoryModel.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//

import Foundation
import SwiftUI


struct CategoryBrand: Identifiable {
    let id = UUID()
    let title: String
    let icon: String 
}

let productCategoryList: [CategoryBrand] = [
    CategoryBrand(title: "All", icon: "All"),
    CategoryBrand(title: "Mens", icon: "Mens"),
    CategoryBrand(title: "Womens", icon: "Womens"),
    CategoryBrand(title: "Kids", icon: "Kids"),
    // Add other categories as needed
]

