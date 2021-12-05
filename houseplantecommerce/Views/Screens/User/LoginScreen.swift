//
//  LoginScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 20.11.2021.
//

import SwiftUI
import URLImage


let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

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
                
                
                
                WelcomeText()
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    
                    .padding(.horizontal,100)
                
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
                    
                    .frame(maxWidth:.infinity)
                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    
                                    .background(Color.green)
                                    .cornerRadius(15.0)
                                    
                    
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

struct WelcomeText : View {
    var body: some View {
        return Text("Welcome !")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.horizontal,65)
    }
}

