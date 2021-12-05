//
//  CartModel.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 21.11.2021.
// Bir yerde boş bir Cart objesi oluşturacağım ve herkes onu kullanacak

import Foundation


struct CartModel : Codable {
    
    var cartProducts : [CartProduct] = [CartProduct]()
    var totalPrice = 0.0
    var userId = ""
}

struct CartProduct : Codable{
    var name : String = ""
    var quantity : Int = 0
    var unitPrice = 0.0
    var id : String = ""
}
