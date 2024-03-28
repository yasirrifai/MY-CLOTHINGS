//
//  ProductCardView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-14.
//
import SwiftUI

struct ProductCardView: View {
    var product: ProductModel
    @EnvironmentObject var cartManager: ShoppingCartViewModel
    @State private var isButtonClicked = false

    var body: some View {
        ZStack(alignment: .leading) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 500,height: 300)
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 20))
            ZStack {
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.system(size: 28, weight: .semibold))
                        .frame(width: 140)
                        .foregroundColor(.black)
                        
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(Color.white)
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("Explore more")
                        
                        Spacer()
                        NavigationLink(destination: ProductDetailsView(product: product).environmentObject(ShoppingCartViewModel()), isActive: $isButtonClicked) {
                                        EmptyView()
                                    }
                        Button {
                            isButtonClicked =  true
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.medium)
                                .frame(width: 60, height: 60)
                                .background(Color.white) 
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.black)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                }
            }
            .padding(.leading)
            .padding()
            .frame(width: 336, height: 400)
            .background(Color(product.color))
            .clipShape(RoundedRectangle(cornerRadius: 60))
            .padding(.leading, 20)
        }
        .background(Color(.cyan).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 60))
    }
}
