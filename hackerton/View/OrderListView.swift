//
//  OrderListView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI

struct OrderListView: View {
    var body: some View {
        VStack {
            HStack(spacing: 200) {
                backBtn
                Text("주문 목록")
                  .font(
                    Font.custom("Inter", size: 48)
                      .weight(.bold)
                  )
                  .foregroundColor(.black)
                Spacer()
            }
            .padding(.leading, 35)
            .frame(alignment: .leading)
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 960, height: 1006)
              .background(Color.BackgroundSecondary)
              .cornerRadius(32)
            HStack(spacing: 27) {
                Image("smileIcon")
                Text("₩ 100,000")
                  .font(
                    Font.custom("Inter", size: 64)
                      .weight(.bold)
                  )
                  .foregroundColor(.black)
                Spacer()
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 74))
                    .foregroundColor(.white)
                    Text("결제")
                      .font(
                        Font.custom("Inter", size: 48)
                          .weight(.bold)
                      )
                      .foregroundColor(.white)
                }
                  .frame(width: 276, height: 118)
                  .background(Color(red: 1, green: 0.48, blue: 0.31))
                  .cornerRadius(32)
            }
            .padding(.leading, 35)
            .padding(.trailing, 29)
        }
       
    }
    
    private var backBtn: some View {
        HStack{
            Image("arrow")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 39, height: 32)
            Text("뒤로 가기")
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.bold)
                )
                .foregroundColor(Color(red: 1, green: 0.35, blue: 0.15))
        }
        .foregroundColor(.clear)
        .frame(width: 191, height: 68)
        .background(Color.BackgroundSecondary)
        .cornerRadius(32)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
