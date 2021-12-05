//
//  UserModel.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 20.11.2021.
//

import Foundation


struct UserModel : Codable {
    var name: String = ""
    var surname : String = ""
    var email : String = ""
    var address : String = ""
    var id : String = ""
    var token : String = ""
    var refreshToken : String = ""
}
