//
//  RegisterScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 20.11.2021.
//

import SwiftUI

struct RegisterScreen: View {
    
    var userRepository : UserRepository = UserRepository()
    @State var newuser : RegisterModel = RegisterModel()
    @State var errorMessage : String = ""
    
    
    var body: some View {
        VStack{
            Form{
                Text(errorMessage)
                TextField("Name", text:$newuser.name)
                TextField("Surname", text:$newuser.surname)
                TextField("EMail", text:$newuser.email)
                SecureField("Password", text:$newuser.password)
                
                Button("Register"){
                    
                    userRepository.registerUser(usermodel: newuser){ result in
                        if result.statusCode == 403{
                            errorMessage = result.error
                        }
                        if result.statusCode == 201{
                            print("Kayıt başarılı")
                        }
                    }
                    
                }
            }
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
