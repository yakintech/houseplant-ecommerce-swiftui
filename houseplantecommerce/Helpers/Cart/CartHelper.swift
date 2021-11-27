//
//  CartHelper.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 27.11.2021.
//

import Foundation

class CartHelper{
    
    func calcTotalPrice(cartProducts: [CartProduct]) -> Double{
        
        var totalPrice = 0.0
        if cartProducts.count > 0{
            
            for item in cartProducts{
                totalPrice = totalPrice + Double(item.quantity) * item.unitPrice
            }
        }
        
        return totalPrice
    }

}
