//
//  HomeScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var fetchProducts = ProductRepository()
    
    var data = [ProductModel]()


    var body: some View {
        
            
        
        
        NavigationView{
            
            List(fetchProducts.products){ item in
                
               NavigationLink(
               
                
                destination: ProductDetailScreen(id: item.id),
                label: {
                    Text(item.name)
                }
                
               ).navigationTitle("Çiçekler")
                    .navigationBarTitleDisplayMode(.inline).padding()
                
                
            }
            
            .onAppear {
               fetchProducts.getAll()
            }
            
        }
        
        
       
        

        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
