//
//  SearchView.swift
//  MY-CLOTHINGS
//
//  Created by Yasir Rifai on 2024-03-23.
//
import SwiftUI

struct SearchView: View {
    @EnvironmentObject var cartManager: ShoppingCartViewModel

    @State private var searchText = ""
    @State private var selectedColor = "Select a color"
    @State private var selectedSize = "Select a size"
    @State private var selectedBrand = "Select a brand"
    @State private var showFilterModal = false
    @State private var selectedProduct: ProductModel?

    var filteredProducts: [ProductModel] {
        var filteredList = productList
        
        // Apply filters based on selected criteria
        if selectedColor != "Select a color" {
            filteredList = filteredList.filter { $0.color == selectedColor }
        }
        if selectedSize != "Select a size" {
            filteredList = filteredList.filter { $0.sizes.contains(selectedSize) }
        }
        if selectedBrand != "Select a brand" {
            filteredList = filteredList.filter { $0.brand == selectedBrand }
        }
        
        // Apply search text filter if searchText is not empty
        if !searchText.isEmpty {
            filteredList = filteredList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        
        return filteredList
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Spacer()
                    
                    Button(action: {
                        showFilterModal = true
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title2)
                    }
                }
                .padding(.horizontal)
                
                if filteredProducts.isEmpty {
                    Text("No products found")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(filteredProducts) { product in
                        NavigationLink(destination: ProductDetailsView(product: product).environmentObject(cartManager)) {
                            ProductRows(product: product)
                                .environmentObject(cartManager)
                        }
                    }
                }
            }
            .navigationTitle("Search Products")
            .sheet(isPresented: $showFilterModal) {
                FilterModalView(selectedColor: $selectedColor, selectedSize: $selectedSize, selectedBrand: $selectedBrand, showFilterModal: $showFilterModal, productList: productList)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ShoppingCartViewModel())
    }
}

struct ProductRows: View {
    let product: ProductModel
    
    var body: some View {
        HStack {
            Image(product.imageName) 
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.horizontal)

                Text("Color: \(product.color), Brand: \(product.brand)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}


struct FilterModalView: View {
    @Binding var selectedColor: String
    @Binding var selectedSize: String
    @Binding var selectedBrand: String
    @Binding var showFilterModal: Bool
    
    let productList: [ProductModel]
    
    var colorOptions: [String] {
        let colors = Set(productList.map { $0.color })
        return ["Select a color"] + Array(colors)
    }
    
    var sizeOptions: [String] {
        let sizes = Set(productList.flatMap { $0.sizes })
        return ["Select a size"] + Array(sizes)
    }
    
    var brandOptions: [String] {
        let brands = Set(productList.map { $0.brand })
        return ["Select a brand"] + Array(brands)
    }
    
    var body: some View {
        VStack {
            Picker("Color", selection: $selectedColor) {
                ForEach(colorOptions, id: \.self) { color in
                    Text(color).tag(color)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            Picker("Size", selection: $selectedSize) {
                ForEach(sizeOptions, id: \.self) { size in
                    Text(size).tag(size)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            Picker("Brand", selection: $selectedBrand) {
                ForEach(brandOptions, id: \.self) { brand in
                    Text(brand).tag(brand)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            Button("Apply Filters") {
                showFilterModal = false
            }
            .padding()
        }
        .padding()
    }
}
