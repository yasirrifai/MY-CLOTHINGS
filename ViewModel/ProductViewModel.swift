////
////  ProductsApiModel.swift
////  MY-CLOTHINGS
////
////  Created by Yasir Rifai on 2024-03-29.
////
//
//import Foundation
//
//import SwiftUI
//
//
//class MovieViewModel : ObservableObject {
//    
//    @Published var productList : [ProductModel] = []
//    
//    let baseUrl = "https://0n358xwfsg.execute-api.us-east-2.amazonaws.com/dev/products";
//    
//    init() {
//        loadMovies()
//    }
//    
//    func loadMovies() {
//        guard let url = URL(string: baseUrl) else {return}
//        
//        URLSession(configuration: .default).dataTask(with:
//                                                        URLRequest(url: url)) {data, response, error in
//            
//            guard let data = data else {return}
//            
//            do {
//                let moviesResponse = try JSONDecoder().decode(Welcome.self, from: data)
//                
//                DispatchQueue.main.async {
//                    self.productList = moviesResponse.
//                }
//                let moviesResults = moviesResponse.results
//                print(moviesResults)
//            }
//            catch{
//                print("Unable to decode the data!!")
//            }
//        }.resume()
//    }
//}
