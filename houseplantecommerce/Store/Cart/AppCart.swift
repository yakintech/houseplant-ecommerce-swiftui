//
//  AppCart.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 21.11.2021.
//

import Foundation

class AppCart : ObservableObject {
    @Published var cart = CartModel()
    
    var cartStorage = CartLocalStorage()
    
    init(){
        
        cart = cartStorage.getCart()
    }
}
