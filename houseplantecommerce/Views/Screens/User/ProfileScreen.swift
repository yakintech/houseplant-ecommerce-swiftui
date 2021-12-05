//
//  ProfileScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 28.11.2021.
//

import SwiftUI

struct ProfileScreen: View {
    
    @EnvironmentObject var userStore : UserStore
    
    var loginStorage : LoginLocalStorage = LoginLocalStorage()
    var tokenStorage = TokenLocalStorage()
    
    
    var body: some View {
        VStack{
            Text("Hoşgeldin \(userStore.userInfo.name)")
       
            
            Button("Sign Out"){
                userStore.loginStatus = false
                
                let emptyModal = TokenStorageModel()
                tokenStorage.setToken(info: emptyModal)
                
                loginStorage.setLoginStatus(status: false);
                
            }
        }
      
        
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .environmentObject(UserStore())
    }
}
