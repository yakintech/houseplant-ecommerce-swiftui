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
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
               
                NavigationLink(destination: LoginScreen(), label:{
                    Text("Login")
                })
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            }
            
        }
    }
}

struct UnauthorizedScreen_Previews: PreviewProvider {
    static var previews: some View {
        UnauthorizedScreen()
    }
}
