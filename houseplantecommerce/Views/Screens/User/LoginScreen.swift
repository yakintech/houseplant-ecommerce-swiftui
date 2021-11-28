//
//  LoginScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 20.11.2021.
//

import SwiftUI



struct LoginScreen : View{
    
    @EnvironmentObject var userStore : UserStore
    
    @State var loginModel : LoginModel = LoginModel()
    @State var errorMessage : String = ""
    @State var selection : String? = ""
    
    var userRepository : UserRepository = UserRepository()
    
    
    var body: some View{
        
            VStack{
                
                NavigationLink(destination: ContentView(), tag: "home", selection: $selection){}
                
                Form{
                    
                    TextField("EMail",text: $loginModel.email)
                    
                    
                    SecureField("Password", text: $loginModel.password)
                    
                    
                    Button("Login"){
                        
                        userRepository.loginCheck(loginModel:loginModel){result in
                            
                            if result.statusCode == 404{
                                errorMessage = result.error
                            }
                            if result.statusCode == 200{
                                userStore.loginStatus = true
                                
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
            .environmentObject(UserStore())
    }
}
