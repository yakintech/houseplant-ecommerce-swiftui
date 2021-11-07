//
//  ContentView.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 30.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            

            Text("Products View")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Products")
                }
                .tag(1)
            
            
            Text("Cart View")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .tag(2)
            
            Text("Blog View")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Blog")
                }
                .tag(3)
            
            Text("Profile View")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//, , Sepet, Blog
