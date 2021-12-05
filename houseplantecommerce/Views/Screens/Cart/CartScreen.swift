//
//  CartScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 21.11.2021.
//

import SwiftUI

struct CartScreen: View {
    
    @EnvironmentObject var appCart : AppCart
    var cartHelper : CartHelper =  CartHelper()
    var cartStorage = CartLocalStorage()
    
    @State var totalPrice  = 0.0
    
    
    var body: some View {
        
        NavigationView{
            
            
            VStack{
                
                Text(String(totalPrice))
                
                List(appCart.cart.cartProducts, id:\.name){ item in
                    
                    VStack{
                        
                        Text("Name: " + item.name + " -" + String(item.quantity) )
                        Text(String(Double(item.quantity) * item.unitPrice))
                        
                        //                    Stepper(value: $appCart.cart.cartProducts[0].quantity, in: 1...5){
                        //                        Text("test")
                        //                    }
                        //
                        
                        Button("Delete"){
                            
                            let sepettekiDigerUrunler = appCart.cart.cartProducts.filter{!$0.id.contains(item.id)}
                            appCart.cart.cartProducts = sepettekiDigerUrunler
                            
                            totalPrice = cartHelper.calcTotalPrice(cartProducts: appCart.cart.cartProducts)
                            
                            cartStorage.setCart(cart: appCart.cart)
                        }
                        
                        
                    }
                }
                
                NavigationLink(
                    destination: OrderScreen(),
                    label: {
                        VStack{
                            Text("Order")
                        }
                    }
                )
                
                
                Button("Empty Cart"){
                    appCart.cart.cartProducts = [CartProduct]()
                    totalPrice = cartHelper.calcTotalPrice(cartProducts: appCart.cart.cartProducts)
                    cartStorage.setCart(cart: appCart.cart)
                }
                .padding()
                
            }.onAppear(){
                if appCart.cart.cartProducts.count > 0{
                    
                    totalPrice = cartHelper.calcTotalPrice(cartProducts: appCart.cart.cartProducts)
                }
            }
            
            
        }
    }
}


struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
            .environmentObject(AppCart())
    }
}




