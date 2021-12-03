//
//  HomeScreen.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import SwiftUI
import  URLImage

struct HomeScreen: View {

    var body: some View {
      
        NavigationView{
            
            VStack{ //En dıştaki VStack
                
                VStack(alignment: .leading, spacing: 10) { //Üstteki ilk 2 satırı barındıran VStack
                    HStack{
                        Spacer()
                    }
                    Text("Flowers")
                        .font(.system(size: 35, weight: .semibold, design: .serif))
                    Text("Choose the best for your beloved")
                        .font(.system(size: 17, weight: .medium, design: .default))
                }//Üstteki ilk 2 satırı barındıran VStackin kapanışı
                
                Spacer()
                    .frame(height: 28) // Stackler arası boşluğu istediğim gibi ayarlayabilmemi sağlıyor.
                
                HStack{ //3. Satırın HStacki
                    Image(systemName: "magnifyingglass")
                        .font(Font.system(size: 25, weight: .light))
                        .padding()
                    TextField("Search...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                } //3. Satırın HStackin kapanışı
                .frame(height: 50)
                .background(Color(.lightGray))
                .cornerRadius(13)
                
                Spacer()
                    .frame(height: 28) // Stackler arası boşluğu istediğim gibi ayarlayabilmemi sağlıyor.
                
                HStack{ //4. Satırın HStackinın açılışı
                    Text("Popular")
                        .font(.system(size: 12, weight: .regular, design: .default ))
                        .frame(width: 77, height: 40)
                        .background(Color(.lightGray))
                        .cornerRadius(13)
                        
                    Spacer()
                    Text("Rose")
                        .font(.system(size: 12, weight: .regular, design: .default ))
                        .frame(width: 77, height: 40)
                        .background(Color(.lightGray))
                        .cornerRadius(13)
                      
                    Spacer()
                    Text("Chamomile")
                        .font(.system(size: 12, weight: .regular, design: .default ))
                        .frame(width: 77, height: 40)
                        .background(Color(.lightGray))
                        .cornerRadius(13)
                     
                    Spacer()
                    Text("Tulips")
                        .font(.system(size: 12, weight: .regular, design: .default ))
                        .frame(width: 77, height: 40)
                        .background(Color(.lightGray))
                        .cornerRadius(13)
                      } //4. Satırın HStackinın kapanışı
                
                Spacer()
                    .frame(height: 27) // Stackler arası boşluğu istediğim gibi ayarlayabilmemi sağlıyor.
                
                VStack{   //5. Satırın HStackinın açılışı
                    Boxes()
                }  //5. Satırın HStackinın kapanışı
                
                
                
                Spacer() //Hepsini yukarı iten Spacer
                    
            }//En dıştaki VStack kapanışı
            .padding()
            
        }//NavigationView kapanışı
        
        
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

//*************************************************************

struct Boxes: View { //Gridin genel dizaynını barındıran Struct
    
    var fetchProducts = AlternativeProductRepository()
    
    @State var boxArray = [ProductModel]()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
       
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(boxArray, id: \.id) { item in
                    NavigationLink(
                        destination: ProductDetailScreen(item: item),
                        label: {
                            BoxView(newBoxModel: item)
                        }//Label ın kapanışı
                        
                    )//NavigationLink in kapanışı
                }
            }
        }//ScrollView in kapanışı
        .onAppear(){
            fetchProducts.getAll(){ productsData in
                boxArray = productsData
            }
        }
        .frame(height: 430)
    }
}

// --------------------------------------------------

struct  BoxView :View { //Griddeki ayrı ayrı kutucukların dizaynını yaptığımız struct
  
    var newBoxModel: ProductModel
    
    var body: some View {

        
        VStack{

            URLImage(URL(string: newBoxModel.images[0])!) { image in
                image
                .resizable()
                .frame(height: 110)
            }
            Spacer()
                .frame(height: 10)
            Text(newBoxModel.name)
            Spacer()
                .frame(height: 10)
            Text(newBoxModel.price.trFormat)
            Spacer()
        
        }//VStack in kapanışı
        .frame(height: 205)
        .background(Color(.gray))
        .cornerRadius(13)
    
    }//Bodynin kapanışı
}//Structın kapanışı

// -------------------------------------------------

extension Double{  // price ı para formatına çevirdiğim extension
 
    var trFormat:String {

        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currencyISOCode
        formatter.locale = Locale(identifier: "TR")
        formatter.currencyCode = "TRY"
        let priceNumber = formatter.string(from: NSNumber(value: self))
        return priceNumber ?? "0"

    }
}


  


// BoxView(newBoxModel: item)
