//
//  ProductListView.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import SwiftUI

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
                else {

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
                ChartNavBarView(totChart: 0,hidden:!showBackButton)
            }
            
            
            }
            .task {
                await mlApiService.search(
                    strQuery: searchString) { mls in
                        productList = mls.results
                        print("Exito task")
                    } failure: { error in
                        print("Error task")
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

