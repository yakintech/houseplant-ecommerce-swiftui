//
//  AlternativeProductRepository.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 13.11.2021.
//

import Foundation


class AlternativeProductRepository{
    
    var products = ProductModel()
    
    func getAll(completionHandler: @escaping ([ProductModel])-> Void){
        
        guard let url = URL(string: Config.apiURL + "/api/products") else {return}
        
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
                do{
                    
                    if let products = data {
                        let decodeData = try JSONDecoder().decode([ProductModel].self, from: products)
                        
                       completionHandler(decodeData)
                    }
                    
                }
                catch{
                    print(error.localizedDescription)
                }

            
        }.resume()
        
    }
    
}
