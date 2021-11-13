//
//  AlternativeHomeScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 13.11.2021.
//

import SwiftUI

struct AlternativeHomeScreen: View {
     var fetchProducts = AlternativeProductRepository()
    
   @State var data = [ProductModel]()


    var body: some View {
        
    
        List(data){ item in
            Text(item.name)
        }
        .onAppear(){
            fetchProducts.getAll(){ productsData in
                data = productsData
            }
        }
        

        
    }
}

struct AlternativeHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlternativeHomeScreen()
    }
}
