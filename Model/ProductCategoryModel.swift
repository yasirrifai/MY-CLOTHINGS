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
    CategoryBrand(title: "All", icon: "img1"),
    CategoryBrand(title: "Mens", icon: "img2"),
    CategoryBrand(title: "Womens", icon: "img3"),
    // Add other categories as needed
]

