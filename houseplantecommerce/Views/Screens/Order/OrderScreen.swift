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
import URLImage

struct OrderScreen: View {
    
    @EnvironmentObject var appCart : AppCart
    var cartHelper : CartHelper =  CartHelper()
    @State var orderModel : OrderModel = OrderModel()
    
    @State var totalPrice = 0.0
    
    var body: some View {
        
        VStack{
            Form {
                Section(header: Text("User Info")) {
                    TextField("EMail", text: $orderModel.email)
                        .padding()
                    TextField("Address", text: $orderModel.address)
                        .padding()
                    TextField("Phone", text: $orderModel.phone)
                        .padding()
                }
                Section(header: Text("Products")) {
                    List(appCart.cart.cartProducts, id:\.name){item in
                        HStack{
                            URLImage(URL(string: "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg")!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50, alignment: .center)
                            }.padding()
                                .cornerRadius(7)
                            VStack(alignment: .leading){
                                Text(item.name)
                                HStack {
                                    Text("Adet : ")
                                    Text(String(item.quantity))
                                }
                            }
                            Spacer(minLength: 0)
                            HStack{
                                Text("Fiyat : ")
                                Text(String(Double(item.quantity) * item.unitPrice))
                            }
                        }
                    }
                }
            }
            
            CheckoutButton(name: "Checkout", total: String(format:"%.3f",totalPrice))
                .background(Color.green)
            
            Spacer(minLength: 0)
            
        }
    }
}

struct OrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrderScreen()
    }
}

struct CheckoutButton: View {
    var name : String
    @State var total : String
    @EnvironmentObject var appCart : AppCart
    var cartHelper : CartHelper =  CartHelper()

    var body: some View {
        Button(action: {
            //
        }) {
            HStack {
                Text("\(name) : \(total)")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }.onAppear(){
            total = String(cartHelper.calcTotalPrice(cartProducts: appCart.cart.cartProducts))
        }
    }
}
