//
//  ProductPreview.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import SwiftUI

struct ProductPreview: View {
    
    let productData: mlProduct
    let imageSize: CGFloat
    
    
    init(productData: mlProduct, imageSize: CGFloat) {
        self.productData = productData
        self.imageSize = imageSize
    }
    
    var body: some View {

        HStack (spacing: 1) {
            VStack (){
                AsyncImage(url: URL(string: productData.urlMeli())) { callResult in
                    
                    if let image = callResult.image {
                        
                        image.resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fit)
                     } else if callResult.error != nil {
                         
                         Text(callResult.error?.localizedDescription ?? "error")
                             .foregroundColor(Color.pink)
                             .frame(width: imageSize, height: imageSize)
                     } else {
                        ProgressView()
                             .frame(width: imageSize, height: imageSize)
                     }
                
                }
                
            }
            .frame(width: 60, height:100 , alignment: .center)
            .padding()

            VStack (alignment: .leading, spacing: 5) {
                    Spacer()
                Text(productData.title!)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)

                Text(productData.price!.formatted(.currency(code: "USD")))
                        .font(.title3)
                    .fontWeight(.bold)
                HStack{
                        
                        ForEach(0 ..< 5) { item in
                            Image("star")
                        }
                    
                    Text("("+String(productData.sold_quantity!)+")Vendidos")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                
                }
                    Spacer()

            }.frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading)
        }.background(.white)
    }
}

struct ProductPreview_Previews: PreviewProvider {
    static var previews: some View {
        ProductPreview(productData: mlProduct(idProd: "ID", titleProd: "Libro Las Vicisitudes Del Contratenor En Mexico Nvo", priceProd: 1000, imgProd: "927362-MLA52990553670_122022", soldQuantity: 300, availableQuantity: 10),imageSize: 100)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
