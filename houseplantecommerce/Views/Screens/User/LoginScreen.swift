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
    
    var userRepository : UserRepository = UserRepository()
    
    
    var body: some View{
        
            VStack{
                
                NavigationLink(destination: ContentView(), tag: "home", selection: $selection){}
                
                
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
                                userStore.loginStatus = true
                                
                            }
                        }
                        
                    }
                    
                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 110, height: 40)
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

