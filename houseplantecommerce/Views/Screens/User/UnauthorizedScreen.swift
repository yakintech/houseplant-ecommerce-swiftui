//
//  UnauthorizedScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 28.11.2021.
//

import SwiftUI

struct UnauthorizedScreen: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: RegisterScreen(), label:{
                    Text("Register")
                })
                NavigationLink(destination: LoginScreen(), label:{
                    Text("Login")
                })
            }
            
        }
    }
}

struct UnauthorizedScreen_Previews: PreviewProvider {
    static var previews: some View {
        UnauthorizedScreen()
    }
}
