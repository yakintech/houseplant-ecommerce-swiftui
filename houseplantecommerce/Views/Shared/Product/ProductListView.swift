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
  @State var data = [ProductModel]()

    
    var body: some View {
     
        List(data){ item in
                           NavigationLink(
            
            
                            destination: ProductDetailScreen(item: item),
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
