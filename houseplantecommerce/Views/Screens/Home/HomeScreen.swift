//
//  HomeScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import SwiftUI
import  URLImage

struct HomeScreen: View {
    
    @ObservedObject var fetchProducts = ProductRepository()
    
    var data = [ProductModel]()


    var body: some View {
        
            
        NavigationView{
            ProductListView()
        }

        

        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
