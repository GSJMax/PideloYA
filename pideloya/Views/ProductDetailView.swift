//
//  ProductDetailView.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//


import SwiftUI

struct ProductDetailView: View {
    
    let productData: mlProduct
    let imageSize: CGFloat
    
    
    init(productData: mlProduct) {
        self.productData = productData
        self.imageSize = 300
    }
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            //Color("Bg")
            ScrollView  {
                AsyncImage(url: URL(string: productData.urlMeli())) {
                    image in
                    image.resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    
                    
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 300, height: 300)
                

                VStack (alignment: .leading) {
                    //                Title
                    Text(productData.title!)
                        .font(.title3)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    //                Rating
                    HStack (spacing: 4) {
                        ForEach(0 ..< 5) { item in
                            Image("star")
                        }
                        
                        Text("("+String(productData.sold_quantity!)+")Vendidos")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        Text(productData.price!.formatted(.currency(code: "USD")))
                            .font(.title)
                            .fontWeight(.bold)
                        
                    }
                    HStack {
                        //Minus Button
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                            
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedCorner(radius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        //                        Plus Button
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .padding(.all, 8)
                                .background(.red)
                                .clipShape(Circle())
                        }
                    }

                    //Info
                    HStack (alignment: .top) {
                        VStack (alignment: .leading) {
                            Text("Vendedor")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Text("Height: 120 cm")
                                .opacity(0.6)
                            Text("Wide: 80 cm")
                                .opacity(0.6)
                            Text("Diameter: 72 cm")
                                .opacity(0.6)
                        }
                        
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        VStack (alignment: .leading) {
                            Text("Caracteristicas")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Text("Jati Wood, Canvas, \nAmazing Love")
                                .opacity(0.6)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical)
                    

                    
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Descripcion")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            
                            Text(productData.title!)
                                .opacity(0.6)
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                    }
                }
                .padding()
                .padding(.top)
                .background(Color("Bg"))
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .offset(x: 0, y: -30.0)
                
            }
            //.edgesIgnoringSafeArea(.top)
            
            HStack {
                VStack{
                    Text("$"+String(productData.price!))
                        .font(.title)
                        .foregroundColor(.white)
                    
                    
                }
                
               
                
                Spacer()
                
                Text("Agregar")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .padding(.horizontal)
            .background(.red)
            .cornerRadius(60.0, corners: .topLeft)
            .cornerRadius(60.0,corners: .topRight)
            .frame(maxHeight: .infinity, alignment: .bottom)
            //.edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(hidden:false,action: {presentationMode.wrappedValue.dismiss()}))
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}




struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productData: mlProduct(idProd: "ID", titleProd: "Libro Las Vicisitudes Del Contratenor En Mexico Nvo", priceProd: 100, imgProd: "970660-MLM52189441994_102022",soldQuantity: 300,availableQuantity: 10))
    }
}

