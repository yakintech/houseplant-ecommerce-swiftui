//
//  LoginScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 20.11.2021.
//

import SwiftUI



struct LoginScreen : View{
    
    @State var loginModel : LoginModel = LoginModel()
    @State var errorMessage : String = ""
    
    var userRepository : UserRepository = UserRepository()
    
    
    var body: some View{
        
        VStack{
            
            Form{
                
                TextField("EMail",text: $loginModel.email)
                 
                
                SecureField("Password", text: $loginModel.password)
                
                
                Button("Login"){
                    
                    userRepository.loginCheck(loginModel:loginModel){result in
                        
                        if result.statusCode == 404{
                            errorMessage = result.error
                        }
                        if result.statusCode == 200{
                            print("Giriş Başarılı")
                        }
                    }
                    
                }
                
            }
            
          
            
            
            
        }
   
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
