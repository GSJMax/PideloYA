//
//  CustomBackButton.swift
//  pideloya
//
//  Created by GSJ on 15/06/23.
//

import SwiftUI


struct CustomBackButton: View {
    let hidden: Bool
    let action: () -> Void
    var body: some View {
        if !hidden{
            Button(action: action) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
                    .padding(.all, 12)
                    .background(Color.white)
                    .cornerRadius(8.0)
            }

        }
           }
}

struct CustomBackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton(
            hidden: false,
            action: {
                print("Action")
            })
    }
}

