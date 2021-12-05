//
//  AlternativeProductRepository.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 13.11.2021.
//

import Foundation


class AlternativeProductRepository{
    
    var products = ProductModel()
    var tokenLocalStorage = TokenLocalStorage()
    
    func getAll(completionHandler: @escaping ([ProductModel])-> Void){
        
        guard let url = URL(string: Config.apiURL + "/api/products") else {return}
        
        var urlRequest = URLRequest(url: url)
        let tokenModel = tokenLocalStorage.getToken()
        urlRequest.setValue(tokenModel.accessToken, forHTTPHeaderField: "Authorization")
        
        
        
        URLSession.shared.dataTask(with: urlRequest) {(data, response, error)  in
            
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 200 {
                    do{
                        
                        if let products = data {
                            let decodeData = try JSONDecoder().decode([ProductModel].self, from: products)
                            
                            completionHandler(decodeData)
                        }
                        
                    }
                    catch{
                                
                 
                        completionHandler([ProductModel]())
                    }
                }
                else if httpResponse.statusCode == 401 {
                    getTokenWithRefreshToken(){tokenModel in
                        
                 
                        
                        if(tokenModel.status == true){
                            
                        }
                        else{
                            completionHandler([ProductModel]())
                        }
                        
                    }
                    //Token düştüğü için tekrar token almam ve mevcut metodu tekrar tetiklemem gerekli
                }
                

            
            }
                    
                  
               
            
        }.resume()
        
    }
    
}


enum APIError : Error{
    case tokenError
}


//1. yol gelen datanın uzunluğuna göre bak
//2. yol repository datanın gelip gelmediğine dair bir özellik daha bana yollasın
