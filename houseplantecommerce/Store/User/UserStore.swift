//
//  UserStore.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 28.11.2021.
//

import Foundation

class UserStore : ObservableObject {
    @Published var loginStatus = false;
    @Published var userInfo = UserInformation()
    var userInfoStorage = UserLocalStorage()
    
    init(){
        userInfo = userInfoStorage.getUserInfo()
        
        loginStatus = userInfo.loginStatus
    }
}

struct UserInformation : Codable{
    var name : String = ""
    var email : String = "";
    var phone : String = "";
    var address : String = "";
    var id : String = ""
    var loginStatus : Bool = false
}




