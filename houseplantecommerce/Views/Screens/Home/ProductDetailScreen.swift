//
//  ProductDetailScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import SwiftUI
import URLImage

struct ProductDetailScreen: View {
    
    var productid : String = ""
    @ObservedObject var fetchProduct = ProductRepository()
     
    init(id:String){
        self.productid = id
    }
    
    
    var body: some View {
        
        VStack{
            
            URLImage(getImage(product: fetchProduct.product)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(fetchProduct.product.description).padding()
        }
        .onAppear(){
            fetchProduct.getProductById(id: self.productid)
        
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



