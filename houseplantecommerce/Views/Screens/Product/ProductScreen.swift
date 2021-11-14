//
//  ProductScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 14.11.2021.
//

import SwiftUI

struct ProductScreen: View {
    var body: some View {
        NavigationView{
            ProductListView()
        }
    }
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen()
    }
}
