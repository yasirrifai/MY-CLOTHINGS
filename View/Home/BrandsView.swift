//
//  BrandsView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-15.
//

import SwiftUI

struct BrandsView: View {
    @EnvironmentObject var cartManager: ShoppingCartViewModel
    
    var body: some View {
        
        
        BrandsCardView()
            .environmentObject(ShoppingCartViewModel())
        
    }
}

#Preview {
    BrandsView()
        .environmentObject(ShoppingCartViewModel())
}
