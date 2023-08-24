//
//  MenuTypeCardView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI

struct MenuTypeCardView: View {
    var body: some View {
        HStack(spacing: 0) {
              Image("snack1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
            VStack{
                Text("스낵")
                  .font(
                    Font.custom("SF Pro", size: 36)
                      .weight(.medium)
                  )
                  .foregroundColor(.black)
                Text("Snack")
                  .font(Font.custom("SF Pro", size: 24))
                  .foregroundColor(.black)
            }
        }
        .padding(.leading, 45)
        .padding(.vertical, 18)
        .frame(width: 273, height: 136, alignment: .leading)
        .background(.white)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
    }
}

struct MenuTypeCardView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTypeCardView()
    }
}
