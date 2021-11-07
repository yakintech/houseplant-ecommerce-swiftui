//
//  UserRepository.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import Foundation



class UserRepository : ObservableObject{
    
    @Published var users = [UserModel]()
    
    func getAll() -> [UserModel]{
        
        guard let url = URL(string: Config.apiURL + "/api/user") else {return [UserModel]()}
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do{
                
                if let users = data {
                    let decodeData = try JSONDecoder().decode([UserModel].self, from: users)
                    
                    self.users = decodeData
                }
                
            }
            catch{
                print("Error")
            }
            
            
        }
        
        return [UserModel]()
        
    }
    
    
}
