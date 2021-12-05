//
//  RegisterScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 20.11.2021.
//   request model

import SwiftUI

struct RegisterScreen: View {
    
    @EnvironmentObject var userStore : UserStore
    
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
                TextField("Address", text: $newuser.address)
                SecureField("Password", text:$newuser.password)
                
                Button("Register"){
                    
                    userRepository.registerUser(usermodel: newuser){ result in
                        if result.statusCode == 403{
                            errorMessage = result.error
                        }
                        if result.statusCode == 201{
                        
                        
                           
                            var userInfo = UserInformation()
//                            //servisten gelen user bilgilerini userInfo ya koyacağım. Onu da store içerisine atacağım. böylelikle user bilgisi hangi ekranda lazımsa o ekran store a bağlanıp çekecek.
                            

                            let registerUser : UserModel = (result.responseData as? UserModel ?? UserModel())

                            userInfo.email = registerUser.email
                            userInfo.address = registerUser.address
                            userInfo.id = registerUser.id
                            userInfo.name = registerUser.name
                            
                            userStore.userInfo = userInfo
                            
                            userStore.loginStatus = true
                        
                       
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
            .environmentObject(UserStore())
    }
}
