//
//  ChartView.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import SwiftUI

struct ChartNavBarView: View {
    let totChart: Double
    let isHidden: Bool
    let isChart: Bool
    var body: some View {
        
        if !isHidden{
        HStack{
            HStack{
                Spacer()
            }.padding(.leading)
            
                HStack {
                    BottomNavBarItem(image: Image(systemName: "cart.fill"), action: {})
                    if isChart{
                        Text("Total:"+totChart.formatted(.currency(code: "USD"))).foregroundColor(.white).fontWeight(.semibold)
                    }else{
                        Text("Agregar a Carrito")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                }
                .padding()
                .background(Color("Color-Red"))
                .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
                .cornerRadius(30, corners: [.topLeft])
                
        }.padding(.leading)
        }
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }.foregroundColor(.white)
    }
}



struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartNavBarView(totChart: 10, isHidden: false,isChart: false)
    }
}
