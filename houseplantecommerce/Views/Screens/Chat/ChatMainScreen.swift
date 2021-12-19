//
//  ChatMainScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 19.12.2021.
//

//Kullanıcılar listelenecek. Eğer bir kullanıcı sistemde ise rengi yeşil olacak. sistemden çıktığında rengi eski haline dönecek

import SwiftUI
import SocketIO

struct ChatMainScreen: View {
    
    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(false), .compress])

    
    var userRepository = GenericRepository<UserListModel>()
    
    @State var userList = [UserListModel]()
    
    var body: some View {
        
        let textColor = Color.red
        
        VStack{
            
            List(userList, id:\.name){item in
                
                if item.onlineStatus {
                    Text(item.email ?? "")
                        .padding()
                        .foregroundColor(textColor)
                }
                else{
                    Text(item.email ?? "")
                        .padding()
                        
                }
                
            }
            
        }
        .onAppear(){
            userRepository.getAll(url:"/api/user"){ users in
                userList = users
            }
            
            
            let socket = manager.defaultSocket
            
            
            socket.on("userlogin") {data, ack in
                
              
            guard let loginUserEMail = data[0] as? String else { return }
                
                
//                var user = userList.first( where: {$0.email == loginUserEMail })
                

                var newUserList = [UserListModel]()
                
                

                for var user in userList {
                    
                    if user.email == loginUserEMail{
                        
                        user.onlineStatus = true
                    }
                    
                    newUserList.append(user);
                }
                
                userList =  newUserList
            }
            
            socket.connect()
        }
    }
}

struct ChatMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatMainScreen()
    }
}
