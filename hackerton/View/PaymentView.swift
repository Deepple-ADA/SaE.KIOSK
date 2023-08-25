//
//  PaymentView.swift
//  hackerton
//
//  Created by Greed on 2023/08/25.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        VStack(spacing: 63){
            Text("결제")
                .font(.system(size: 48, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            Spacer().frame(height: 46)
            payByCard
            payByApplePay
            Spacer()
        }
        .padding(.top, 66)
    }
    
    private var payByCard: some View {
        Button {
            
        } label: {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 650, height: 203)
                .background(.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .inset(by: 1)
                        .stroke(Color.AccentPrimary, lineWidth: 2)
                        .overlay(
                            HStack{
                                Image("creditcard")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 115, height: 84)
                                Spacer()
                                Text("신용/체크카드")
                                    .font(.system(size: 64, weight: .bold))
                                    .foregroundColor(.black)
                            }
                                .padding(.leading, 57)
                                .padding(.trailing, 53)
                        )
                )
        }
    }
    private var payByApplePay: some View {
        Button {
            
        } label: {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 650, height: 203)
                .background(.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .inset(by: 1)
                        .stroke(Color.AccentPrimary, lineWidth: 2)
                        .overlay(
                            HStack{
                                Image("applepaymark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 83)
                                Spacer()
                                Text("Apple Pay")
                                    .font(.system(size: 64, weight: .bold))
                                    .foregroundColor(.black)
                            }
                                .padding(.leading, 50)
                                .padding(.trailing, 85)
                        )
                )
        }
        
    }
    private var backBtn: some View {
        HStack{
            Image("arrow")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 39, height: 32)
            Text("뒤로 가기")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color.AccentPrimary)
        }
        .foregroundColor(.clear)
        .frame(width: 191, height: 68)
        .background(Color.BackgroundSecondary)
        .cornerRadius(32)
    }
    
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
