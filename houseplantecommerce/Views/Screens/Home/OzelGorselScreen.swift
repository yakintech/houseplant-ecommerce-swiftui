//
//  OzelGorselScreen.swift
//  houseplantecommerce
//
//  Created by burak cakir on 11.11.2021.
//

import SwiftUI

struct OzelGorselScreen: View {
    var image : Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio( contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.purple , lineWidth: 4))
            .shadow( radius: 4)
            .padding()

    }
}

struct OzelGorselScreen_Previews: PreviewProvider {
    static var previews: some View {
        OzelGorselScreen(image : Image("kirmizigül"))
    }
}
