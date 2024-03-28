import SwiftUI

struct ContentView: View {
    @State private var showingBottomNavigation = false
    @Binding var isAppLoaded: Bool
    var body: some View {
        VStack {
            // Brand Logo
            Image("MY")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .cornerRadius(10)
                .padding()
            
            ProgressView("loading...")
                .padding()
                .italic()
        }
        .fullScreenCover(isPresented: $showingBottomNavigation) {
            BottomNavigationBarView()
        }
        .onAppear {
            // Simulate loading for 5 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                showingBottomNavigation = true
            }
        }
    }
}


