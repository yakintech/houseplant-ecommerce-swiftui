//
//  ContentView.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 30.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    @StateObject var appCart : AppCart = AppCart()
    @StateObject var userStore : UserStore = UserStore()
    
    var body: some View {
    
        TabView(selection: $selection){
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            

            ProductScreen()
                .tabItem {
                    Image(systemName: "leaf")
                    Text("Products")
                }
                .tag(1)
            

           CartScreen()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart-\(appCart.cart.cartProducts.count)")
                }
                .tag(2)
            
            ChatMainScreen()
                .tabItem {
                    Image(systemName: "heart.text.square")
                    Text("Chat")
                }
                .tag(3)
            
            ProfileMainScreen()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                    Text("Profile")
                }
                .tag(4)
            
        }
        .environmentObject(appCart)
        .environmentObject(userStore)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {


    static var previews: some View {
        ContentView()
            .environmentObject(AppCart())
            .environmentObject(UserStore())
    }
}
