//
//  OrderCardView.swift
//  hackerton
//
//  Created by Greed on 2023/08/25.
//

import SwiftUI

struct OrderCardView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 895, height: 203)
            .background(.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
            .overlay(
                HStack {
                    Image("snack1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 178, height: 178)
                    Text("새우깡")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.black)
                    Text("₩ 100,000")
                        .font(.system(size: 36, weight: .bold))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color.PointSecondary)
                        .frame(width: 224, alignment: .topTrailing)
                }
            )
    }
}

struct OrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCardView()
    }
}
