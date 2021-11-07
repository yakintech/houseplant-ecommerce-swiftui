//
//  ProductDetailScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import SwiftUI

struct ProductDetailScreen: View {
    
    var productid : String = ""
    @ObservedObject var fetchProduct = ProductRepository()
    
    init(id:String){
        self.productid = id
    }
    
    
    var body: some View {
        
        VStack{
            Text(fetchProduct.product.description).padding()
        }
        .onAppear(){
            fetchProduct.getProductById(id: self.productid)
        }
        
    }
}
