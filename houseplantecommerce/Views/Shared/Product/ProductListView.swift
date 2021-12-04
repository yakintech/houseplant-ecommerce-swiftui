//
//  ProductListView.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 14.11.2021.
//

import SwiftUI
import URLImage

struct ProductListView: View {
    
    var fetchProducts = AlternativeProductRepository()
    
    @EnvironmentObject var appCart : AppCart
    
    @State var data = [ProductModel]()
    
    var body: some View {
        
        VStack{
            
            if($data.count > 0){
                List(data){ item in
                    NavigationLink(
                        
                        
                        destination: ProductDetailScreen(item: item),
                        label: {
                            VStack{
                                
                                URLImage(URL(string: item.images[0])!) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                Text(item.name)
                                Text(String(item.price))
                                
                            }
                        }
                        
                    ).navigationTitle("Çiçekler")
                        .navigationBarTitleDisplayMode(.inline).padding()
                    
                    Button("Add to cart"){
                        
                        guard let indexNo = appCart.cart.cartProducts.firstIndex(where: {$0.id == item.id})
                        else  {
                            
                            let newCartProduct = CartProduct(name: item.name, quantity: 1, unitPrice: item.price, id: item.id)
                            appCart.cart.cartProducts.append(newCartProduct);
                            appCart.cart.totalPrice = appCart.cart.totalPrice + item.price
                            return
                        }
                        
                        
                        appCart.cart.cartProducts[indexNo].quantity = appCart.cart.cartProducts[indexNo].quantity + 1
                        
                        
                    }
                }
            }
            else{
                Text("Ürünler bulunamadı")
            }
            
            
        }
        .onAppear(){
            fetchProducts.getAll(){ productsData in
                data = productsData
            }
        }
        


       
        
        
        
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
