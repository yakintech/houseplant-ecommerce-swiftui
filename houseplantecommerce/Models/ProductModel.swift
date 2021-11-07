//
//  ProductModel.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import Foundation


struct ProductModel :Codable, Identifiable {
    
    var id: String = ""
    var name:String = ""
    var description:String = ""
    var images : [String] = [String]()
    
    
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name = "name"
            case description = "description"
            case images = "images"
        }
}

