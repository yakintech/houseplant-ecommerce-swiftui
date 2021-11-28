//
//  OrderScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 28.11.2021.
//

//Sipariş toplam tutar
//Ürünler...
//

import SwiftUI

struct OrderScreen: View {
    
    @EnvironmentObject var appCart : AppCart
    var cartHelper : CartHelper =  CartHelper()
    @State var orderModel : OrderModel = OrderModel()
    
    @State var totalPrice = 0.0
    
    var body: some View {
        
        VStack{
            Text("Toplam Sipariş Tutarı: \(totalPrice)")
                .onAppear(){
                    totalPrice = cartHelper.calcTotalPrice(cartProducts: appCart.cart.cartProducts)
                }
            List(appCart.cart.cartProducts, id:\.name){item in
                Text("Name: " + item.name + " -" + String(item.quantity) )
                Text(String(Double(item.quantity) * item.unitPrice))
            }
            
            TextField("EMail", text: $orderModel.email)
                .padding()
            
            TextField("Address", text: $orderModel.address)
                .padding()
            
            TextField("Phone", text: $orderModel.phone)
                .padding()
            
            Button("Order"){
                
                
                
            }
            Spacer()
            
            
        }
    }
}

struct OrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrderScreen()
    }
}
