//
//  ProductListView.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import SwiftUI


/// View: Muestra ScrollView Layout con lista de productos resutado de la consulta en  https://api.mercadolibre.com/sites/MLM/search?q=
struct ProdListView: View {
    
    let title: String
    let searchString: String
    let showBackButton: Bool
    
    @StateObject var mlApiService = MLApiService()
    @State private var productList: [mlProduct]?
    @State private var product: mlProduct?
    
    @Environment(\.presentationMode) var presentationMode2: Binding<PresentationMode>
    var body: some View {
        ZStack (alignment: .leading )
        {
                if (mlApiService.isSearching) {
                    ProgressView("Obteniendo...")
                }
            else if (mlApiService.isError){
                VStack{
                    Image("chemsError").scaledToFill()
                    Text("Upps parece que no tenemos conexion..")
                }.padding()
            }
             else{

                    ScrollView (.vertical,
                                showsIndicators: true) {
                        VStack (spacing: 3) {
                            Color(#colorLiteral(
                                red: 0.937254902,
                                green: 0.937254902,
                                blue: 0.937254902,
                                alpha: 1))
                                .ignoresSafeArea()
                            
                            ForEach(mlApiService.products, id: \.self) { product in
                                    NavigationLink(
                                        destination: ProductDetailView(productData: product),
                                        label: {
                                            ProductPreview(productData: product,imageSize: 120)
                                        })
                                    .foregroundColor(.black)
                            }
                        }//VStack
                    }//ScrollView
                    .padding(.bottom,2)
                    .padding(.trailing,5)
                    .padding(.leading,5)
                    .background(Color.gray.opacity(0.1))
                    
                }
            
            VStack {
                Spacer()
                ChartNavBarView(totChart: 0,isHidden :!showBackButton,isChart: true)
            }
            
            
            }
            .task {
                await mlApiService.search(
                    strQuery: searchString) { mls in
                        productList = mls.results
                        
                    } failure: { error in
                        
                    }
            }
        .navigationBarBackButtonHidden(true)
        .navigationTitle(showBackButton == true ? title : "")
            .navigationBarItems(
                leading: CustomBackButton(
                    hidden: !showBackButton,
                    action: {
                        presentationMode2.wrappedValue.dismiss()
                    }))
    }
    
}



struct ProdListView_Previews: PreviewProvider {
    static var previews: some View {
        ProdListView(title: "Titulo", searchString: "hotsale",showBackButton: true)
    }
}

