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
                .font(.system(size: 20, weight: .semibold, design: .rounded))
//                .frame(width: 200, height: 60)
//                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            
            Button("Sign Out"){
                userStore.loginStatus = false
                
                let emptyModal = TokenStorageModel()
                tokenStorage.setToken(info: emptyModal)
                
                loginStorage.setLoginStatus(status: false);
                
            }
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .frame(width: 200, height: 60)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
            .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            
        }
      
        
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .environmentObject(UserStore())
    }
}
