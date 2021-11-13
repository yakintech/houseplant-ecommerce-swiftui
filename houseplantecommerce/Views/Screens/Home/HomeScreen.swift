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
            
            List(fetchProducts.products){ item in
                
               NavigationLink(
               
                
                destination: ProductDetailScreen(id: item.id),
                label: {
                    VStack{
                        Text(item.name)
                        URLImage(URL(string: item.images[0])!) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }
                       Text(String(item.price))
                    }
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
