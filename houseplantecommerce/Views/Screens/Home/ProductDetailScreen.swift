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
    @State var imageUrl : URL = URL(string: "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg")!
    
    @ObservedObject var fetchProduct = ProductRepository()
     
    init(id:String){
        self.productid = id
        
    }
    
    
    var body: some View {
        
        VStack{
            
            URLImage(imageUrl) { image in
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
