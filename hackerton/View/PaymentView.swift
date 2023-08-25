//
//  PaymentView.swift
//  hackerton
//
//  Created by Greed on 2023/08/25.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var stack: NavigationPath
    
    var body: some View {
        NavigationStack(path: $stack) {
            VStack(spacing: 63){
                HStack(spacing: 250) {
                    backBtn
                    title
                    Spacer()
                }
                .padding(.leading, 35)
                .frame(alignment: .leading)
                Spacer().frame(height: 46)
                payByCard
                payByApplePay
                Spacer()
            }
            .padding(.top, 66)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var title: some View {
        HStack {
            Text("결제")
                .font(.system(size: 48, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
        }
    }
    
    private var backBtn: some View {
        Button {
            dismiss()
        } label: {
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
    
    private var payByCard: some View {
        NavigationLink {
           AfterPaymentView(stack: $stack)
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
        NavigationLink {
            AfterPaymentView(stack: $stack)
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
    
}

//struct PaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PaymentView(stack: .constant(NavigationPath()))
//    }
//}
