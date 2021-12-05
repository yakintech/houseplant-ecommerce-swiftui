//
//  LocalStorage.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 5.12.2021.
//


//logged - noptLogged
import Foundation

//class LocalStorage {
//
//
//    public static var loginStatusValue : String {
//
//        set{
//            UserDefaults.standard.set(newValue, forKey: "loginStatusKey")
//        }
//        get{
//            return UserDefaults.standard.string(forKey: "loginStatusKey") ?? ""
//        }
//
//    }
//
//}


class LoginLocalStorage{
    
    //Bu fonksiyon cep telefonundaki storage kısmından değer okur
    func getLoginStatus() -> Bool{
        return UserDefaults.standard.bool(forKey: "loginStatus")
    }
    
    //Bu fonksiyon cep telefonunun storage kısmına değer set eder.
    func setLoginStatus(status:Bool){
        UserDefaults.standard.set(status, forKey: "loginStatus")
    }
    
}

class CartLocalStorage {

    func getCart() -> CartModel{
        
        
      
        if let cart = UserDefaults.standard.object(forKey: "userCart") as? Data {
            let decoder = JSONDecoder()
            if let loadedCart = try? decoder.decode(CartModel.self, from: cart) {
                return loadedCart
            }
        }
        
        return CartModel()
        
    }
    
    func setCart(cart: CartModel){
        
      
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cart) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "userCart")
        }
        
    }
    
}


class TokenLocalStorage{

    func getToken() -> TokenStorageModel{
        
        
      
        if let token = UserDefaults.standard.object(forKey: "token") as? Data {
            let decoder = JSONDecoder()
            if let loadedToken = try? decoder.decode(TokenStorageModel.self, from: token) {
                return loadedToken
            }
        }
        
        return TokenStorageModel()
        
    }
    

    func setToken(info:TokenStorageModel){
        
      
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(info) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "token")
        }
        
    }
}

struct TokenStorageModel : Codable{
    var accessToken = ""
    var refreshToken = ""
}

class UserLocalStorage{
    
    //Bu fonksiyon cep telefonundaki storage kısmından değer okur
    func getUserInfo() -> UserInformation{
        
        
      
        if let userInfo = UserDefaults.standard.object(forKey: "userInfo") as? Data {
            let decoder = JSONDecoder()
            if let loadedUserInfo = try? decoder.decode(UserInformation.self, from: userInfo) {
                return loadedUserInfo
            }
        }
        
        return UserInformation()
        
    }
    
    //Bu fonksiyon cep telefonunun storage kısmına değeri set eder.
    func setUserInfo(info:UserInformation){
        
      
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(info) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "userInfo")
        }
        
    }
    
}


//bool, string, int
//object => JSON a çevirmen gerek






