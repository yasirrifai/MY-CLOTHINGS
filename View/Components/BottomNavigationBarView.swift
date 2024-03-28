//
//  BottomNavigationBarView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//

import SwiftUI

struct BottomNavigationBarView: View {
    @State private var tabSelection = 0
    @EnvironmentObject var cartManager: ShoppingCartViewModel
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
                .environmentObject(cartManager)
            
            BrandsView()
                .tabItem {
                    Label("Brands", systemImage: "square.grid.2x2.fill")
                }
                .tag(1)
                .environmentObject(cartManager)
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(2)
                .environmentObject(cartManager)
            
            WishListView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart.fill")
                }
                .tag(3)
                .environmentObject(cartManager)
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
                .tag(4)
                .environmentObject(cartManager)
        }
        .accentColor(.blue) 
    }
}

