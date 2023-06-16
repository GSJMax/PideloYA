//
//  SearchHomeView.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import SwiftUI

struct SearchHomeView: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    
    private let categories = ["Electronica", "Computo", "Telefonos","Videojuegos"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        //AppBarView()
                        
                        TitleView()
                            .padding(.bottom).frame(maxWidth: .infinity,  alignment: .center)
                        
                        SearchAndScanView(search: $search)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
                        
                        ProdListView(
                            title: "Destacados",
                            searchString: "Laptop",
                            showBackButton: false
                        )

                    }
                }
                
                VStack {
                    Spacer()
                    ChartNavBarView(totChart: 0, hidden: false)
                }
            }
        }

    }
}

struct TitleView: View {
    
    
    var body: some View {
        Text("Pidelo")
            .font(.custom("PlayfairDisplay-Regular", size: 30))
            .foregroundColor(Color(.red))
            
            +
        Text("Ya!")
            .font(.custom("PlayfairDisplay-Bold", size: 36))
            .fontWeight(.bold)
            .foregroundColor(Color(.red))
    }
    
    
}

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                TextField("Buscalo Ya!", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            
            NavigationLink(
                destination: ProdListView(title: search,searchString: search,showBackButton: true),
                label: {
                    Image(systemName: "magnifyingglass")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(.red))
                        .cornerRadius(10.0)
                })

        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}






struct SearchHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHomeView().previewDevice("iPhone 8")
            .previewInterfaceOrientation(.portrait)
    }
}
