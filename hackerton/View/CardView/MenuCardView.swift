//
//  MenuCardView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI

struct MenuCardView: View {
    var body: some View {
        HStack {
            product.새우깡.item.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 178, height: 178)
                .clipped()
            VStack(alignment: .leading) {
                Text(product.새우깡.item.name)
                  .font(
                    Font.custom("Inter", size: 48)
                      .weight(.bold)
                  )
                  .foregroundColor(.black)
                Text(product.새우깡.item.desc)
                  .font(Font.custom("Inter", size: 24))
                  .foregroundColor(.black)
                  .frame(width: 224, alignment: .topLeading)
                Text("₩ \(product.새우깡.item.price)")
                  .font(
                    Font.custom("Inter", size: 20)
                      .weight(.bold)
                  )
                  .multilineTextAlignment(.trailing)
                  .foregroundColor(Color(red: 0.11, green: 0.27, blue: 0.82))
                  .frame(width: 224, alignment: .topTrailing)
            }
        }
        .foregroundColor(.clear)
        .frame(width: 431, height: 203)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
    }
}

struct MenuCardView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCardView()
    }
}
