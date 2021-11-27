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
    
    @State var count : Int = 1
    
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
                
                
                guard let indexNo = appCart.cart.cartProducts.firstIndex(where: {$0.id == self.product.id})
                else  {
                    
                    let newCartProduct = CartProduct(name: self.product.name, quantity: count, unitPrice: self.product.price, id: self.product.id)
                    appCart.cart.cartProducts.append(newCartProduct);
                    appCart.cart.totalPrice = appCart.cart.totalPrice + (Double(count) * product.price)
                    return
                }
                
   
                appCart.cart.cartProducts[indexNo].quantity = appCart.cart.cartProducts[indexNo].quantity + count
                
                
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



