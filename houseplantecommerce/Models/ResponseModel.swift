//
//  ResponseModel.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 20.11.2021.
//

import Foundation


struct ResponseModel {
    
    var statusCode : Int = 0
    var responseData : Any = ""
    var error : String = ""
    
}


struct ErrorModel : Codable {
    var message : String = ""
}

