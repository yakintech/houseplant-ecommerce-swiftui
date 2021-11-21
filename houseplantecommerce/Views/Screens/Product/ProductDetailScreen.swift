//
//  ProductDetailScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import SwiftUI
import URLImage

struct ProductDetailScreen: View {
    
    var product = ProductModel()
    
    @EnvironmentObject var appCart : AppCart
    
    @State var count = 1
    
    init(item:ProductModel){
        self.product = item
    }
    
    
    var body: some View {
        
        VStack{
            
           
            URLImage(getImage(product: self.product)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(self.product.description).padding()
            
            Stepper(value: $count, in: 1...5){
                Text("Count: \(count)")
            }
            
            Button("Add to cart"){
               
                //Sepette bu ürün varsa o ürünün miktarı değiştirilir yoksa yeni ürün eklenir
                //Örneğin sepette 1 adet papatya var ve ben 2 adet eklemek istiyorum

                var sepetteBuUrunVarMi = false;
                
                if  appCart.cart.cartProducts.count > 0 {
                    
                    //0 dan büyükse sepette ürün var demektir. Şimdi sepette eklenecek ürün var mı ona bakıyoruz...
                    var cartData = appCart.cart.cartProducts.filter{$0.name.contains(self.product.name)}
                    
                    if cartData.count > 0{
                        cartData[0].quantity =  cartData[0].quantity  + count
                        sepetteBuUrunVarMi = true;
                        
                        appCart.cart.totalPrice = appCart.cart.totalPrice + (Double(count) * product.price)
                    }
                    
                    
                }
                
                if sepetteBuUrunVarMi == false {
                    var newCartProduct = CartProduct(name: self.product.name, quantity: count, unitPrice: self.product.price)
                    appCart.cart.cartProducts.append(newCartProduct);
                    
                    appCart.cart.totalPrice = appCart.cart.totalPrice + (Double(count) * product.price)
                }
            }

        }
        
    }
}





func getImage(product:ProductModel) -> URL{
    if(product.images.count > 0){
       return URL(string: product.images[0])!
  
    }
    else{
        return URL(string: "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg")!
      
    }
}



