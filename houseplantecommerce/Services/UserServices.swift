//
//  UserServices.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import Foundation


class FetchUser : ObservableObject{
    
    @Published var users = [UserModel]()
    
    
    func getAll() -> [UserModel]{
        
        let url = URL(string: "http://localhost:3000/api/user")
    }
    
}
