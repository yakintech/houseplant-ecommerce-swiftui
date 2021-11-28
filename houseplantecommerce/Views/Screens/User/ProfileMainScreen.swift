//
//  ProfileMainScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 28.11.2021.
//

import SwiftUI

struct ProfileMainScreen: View {
    
    @EnvironmentObject var userStore : UserStore
    
    var body: some View {
        
        if userStore.loginStatus {
            ProfileScreen()
        }
        else{
            UnauthorizedScreen()
        }
    }
}

struct ProfileMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMainScreen()
            .environmentObject(UserStore())
    }
}


//Register screen
//Login screen

// üye ol veya giriş yap UnauthorizedScreen
//Profil ekranı Kullanıcı bilgilerinin olduğu bunların güncellendiği ekran ProfileScreen
//changePassword


