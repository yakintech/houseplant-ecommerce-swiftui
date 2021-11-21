//
//  CartScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 21.11.2021.
//

import SwiftUI

struct CartScreen: View {
    
    @EnvironmentObject var appCart : AppCart
    @State var testData : Int = 0

    


    var body: some View {

        VStack{
        
            Text(String(appCart.cart.totalPrice))
              

            List(appCart.cart.cartProducts, id:\.name){ item in

                VStack{
               
                    Text("Product Name: " + item.name + " - quantity: " + String(item.quantity))
                    
                    Stepper(value: $appCart.cart.cartProducts[0].quantity, in: 1...5){
                        Text("test")
                    }
                    
              


                    Button("Delete"){

                        let sepettekiDigerUrunler = appCart.cart.cartProducts.filter{!$0.name.contains(item.name)}

                        appCart.cart.cartProducts = sepettekiDigerUrunler


                    }


                }
            }
            
            Button("Empty Cart"){
                appCart.cart.cartProducts = [CartProduct]()
                appCart.cart.totalPrice = 0.0
            }
            .padding()
            
        }
        
           
    }
}



