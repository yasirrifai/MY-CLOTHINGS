//
//  MY_CLOTHINGSApp.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-12.
//

import SwiftUI

@main
struct MY_CLOTHINGSApp: App {
    @StateObject private var cartManager = ShoppingCartViewModel()
    @State private var isAppLoaded = false

    var body: some Scene {
        WindowGroup {
            if isAppLoaded {
                            BottomNavigationBarView()
                                .environmentObject(cartManager)
                        } else {
                            ContentView(isAppLoaded: $isAppLoaded)
                                .environmentObject(cartManager)
                        }
                }

    }
}
