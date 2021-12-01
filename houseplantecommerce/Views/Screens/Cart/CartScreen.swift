//
//  CartScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 21.11.2021.
//

import SwiftUI
import URLImage

struct CartScreen: View {
    
    @EnvironmentObject var appCart : AppCart
    var cartHelper : CartHelper =  CartHelper()
    
    @State var totalPrice  = 0.0
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                List(appCart.cart.cartProducts, id:\.name){ item in
                    HStack{
                        URLImage(URL(string: "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg")!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70, alignment: .center)
                        }.padding()
                            .cornerRadius(7)
                        
                        VStack(alignment:.leading){
                            Text(item.name)
                            HStack {
                                Text("Adet : ")
                                Text(String(item.quantity))
                            }
                            HStack{
                                Text("Fiyat : ")
                                Text(String(Double(item.quantity) * item.unitPrice))
                            }
                        }
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            let sepettekiDigerUrunler = appCart.cart.cartProducts.filter{!$0.id.contains(item.id)}
                            appCart.cart.cartProducts = sepettekiDigerUrunler
                            
                            totalPrice = cartHelper.calcTotalPrice(cartProducts: appCart.cart.cartProducts)
                        }) {
                            Image(systemName: "trash")
                                .resizable()
                                .font(.largeTitle)
                                .foregroundColor(.red)
                                .frame(width: 25, height: 25)
                                .padding()
                        }.padding()
                    }
                }
                PaymentButton(totalPrice: totalPrice,name: "Payment")
                Spacer()
                
            }.onAppear(){
                if appCart.cart.cartProducts.count > 0{
                    totalPrice = cartHelper.calcTotalPrice(cartProducts: appCart.cart.cartProducts)
                }
            }.navigationBarTitle(Text("Cart"),displayMode: .inline)
                .navigationBarItems(trailing: EmptyButton(aCart: appCart, price: totalPrice, helper: cartHelper))
                .cornerRadius(10)
                .padding()
                .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 5)
        }
    }
}


struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
            .environmentObject(AppCart())
    }
}

struct EmptyButton: View {
    var aCart : AppCart
    @State var price : Double = 0.0
    var helper : CartHelper

    var body: some View {
        Button(action: {
            aCart.cart.cartProducts = [CartProduct]()
            price = helper.calcTotalPrice(cartProducts: aCart.cart.cartProducts)
        }) {
            HStack {
                Text("Empty Cart")
                    .fontWeight(.semibold)
            }
            .padding()
            .foregroundColor(.red)
            .cornerRadius(40)
        }
    }
}

struct PaymentButton: View {
    @State var totalPrice : Double
    @EnvironmentObject var appCart : AppCart
    var cartHelper : CartHelper =  CartHelper()
    var name: String

    var body: some View {
        HStack{
            VStack{
                Text("TOTAL")
                    .fontWeight(.semibold)
                Text(String(totalPrice))
                    .foregroundColor(.orange)
            }
            NavigationLink(
                destination: OrderScreen(),
                label: {
                    Text(name)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            )
        }
    }
}
