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
    
    
    var userLocalStorage = UserLocalStorage()
    var tokenLocalStorage = TokenLocalStorage()
    
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

                                var userInfo = UserInformation()

                                let loginUser : UserModel = (result.responseData as? UserModel ?? UserModel())

                                userInfo.email = loginUser.email
                                userInfo.address = loginUser.address
                                userInfo.id = loginUser.id
                                userInfo.name = loginUser.name
                                userInfo.loginStatus = true

                                userStore.userInfo = userInfo
                                userStore.loginStatus = true
                                
                                var tokenModel = TokenStorageModel()
                                tokenModel.accessToken = loginUser.token;
                                tokenModel.refreshToken = loginUser.refreshToken
                                
                               
                                tokenLocalStorage.setToken(info: tokenModel)
                                
                               
                                //Info bilgilerini alıp storage a attım. App kapandığında da bilgilere ulaşmak için
                                userLocalStorage.setUserInfo(info: userInfo)
                                
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
