//
//  UserListModel.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 19.12.2021.
//

import Foundation


struct UserListModel : Codable{
    var _id : String? = ""
    var name: String? = ""
    var surname : String? = ""
    var email : String? = ""
    var onlineStatus : Bool = false
    
    private enum CodingKeys: String, CodingKey {
            case _id, name, surname, email
        }
}
