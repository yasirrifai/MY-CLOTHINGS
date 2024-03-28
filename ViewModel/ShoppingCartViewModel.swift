//
//  ShoppingCartViewModel.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//

import Foundation
import Combine

class ShoppingCartViewModel: ObservableObject {
    @Published private(set) var products: [ProductModel] = []
    @Published private(set) var total: Double = 0

    func addToCart(product: ProductModel) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity += 1
        } else {
            products.append(product)
        }
        total += Double(product.price)
    }

    func removeFromCart(product: ProductModel) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            if products[index].quantity > 1 {
                products[index].quantity -= 1
            } else {
                products.remove(at: index)
                total = 0
            }
            total -= Double(product.price)
        }
    }

    
    func clearCart() {
        products.removeAll()
        total = 0
    }
}
