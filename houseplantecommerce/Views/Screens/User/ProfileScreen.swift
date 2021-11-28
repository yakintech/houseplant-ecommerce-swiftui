//
//  ProfileScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 28.11.2021.
//

import SwiftUI

struct ProfileScreen: View {
    
    @EnvironmentObject var userStore : UserStore
    
    var body: some View {
        VStack{
            Text("Kullanıcı Ekranı")
                .padding()
            
            Button("Sign Out"){
                userStore.loginStatus = false
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
