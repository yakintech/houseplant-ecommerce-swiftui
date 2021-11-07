//
//  ProductRepository.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import Foundation

class ProductRepository : ObservableObject{
    
    @Published var products = [ProductModel]()
    @Published var product = ProductModel()
    
    func getAll() -> [ProductModel]{
        
        guard let url = URL(string: Config.apiURL + "/api/products") else {return [ProductModel]()}
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            DispatchQueue.main.async {
                do{
                    
                    if let products = data {
                        let decodeData = try JSONDecoder().decode([ProductModel].self, from: products)
                        
                        self.products = decodeData
                    }
                    
                }
                catch{
                    print(error.localizedDescription)
                }
            }
   
            
        }.resume()
        
        return self.products
        
    }
    
    
    func getProductById(id:String) -> ProductModel{
        
        guard let url = URL(string: Config.apiURL + "/api/products/" + id) else {return ProductModel()}
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            DispatchQueue.main.async {
                do{
                    
                    if let product = data {
                        let decodeData = try JSONDecoder().decode(ProductModel.self, from: product)
                        
                        self.product = decodeData
                    }
                    
                }
                catch{
                    print(error.localizedDescription)
                }
            }
   
            
        }.resume()
        
        return self.product
        
    }
    
    
}
