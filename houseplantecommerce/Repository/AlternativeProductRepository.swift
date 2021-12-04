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
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(LoginHelper.token, forHTTPHeaderField: "Authorization")
        
        
        
        URLSession.shared.dataTask(with: urlRequest) {(data, response, error)  in
            
                    
                    do{
                        
                        if let products = data {
                            let decodeData = try JSONDecoder().decode([ProductModel].self, from: products)
                            
                            completionHandler(decodeData)
                        }
                        
                    }
                    catch{
                                
                        completionHandler([ProductModel]())
                    }
               
            
        }.resume()
        
    }
    
}


enum APIError : Error{
    case tokenError
}


//1. yol gelen datanın uzunluğuna göre bak
//2. yol repository datanın gelip gelmediğine dair bir özellik daha bana yollasın
