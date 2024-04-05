import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    
    @Published var productList: [Product] = []
    
    let baseUrl = "https://an3j46rxw5.execute-api.us-east-2.amazonaws.com/dev/products"
    
    init() {
        loadProducts()
    }
    
    func loadProducts() {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                let productsResponse = try JSONDecoder().decode([Product].self, from: data)
                
                DispatchQueue.main.async {
                    self.productList = productsResponse
                }
                
                print(productsResponse)
            } catch {
                print("Unable to decode the data!!")
            }
        }.resume()
    }
}


