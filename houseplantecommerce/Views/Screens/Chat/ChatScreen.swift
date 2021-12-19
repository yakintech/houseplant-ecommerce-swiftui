//
//  ChatScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 19.12.2021.
//

import SwiftUI
import SocketIO


let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(false), .compress])


struct ChatScreen: View {
    
    @State var messages = [String]()
    @State var sendmessage = ""
    
    var body: some View {
        
        TextField("your message: ", text: $sendmessage)
            .padding()
        
        Button("Send"){
            
            let socket = manager.defaultSocket
        
  
            socket.emit("sendermessage", sendmessage)
        }
        .padding()
        
     
        List(messages, id:\.self){item in
            Text(item)
        }
    }
}

struct ChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatScreen()
    }
}
