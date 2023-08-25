//
//  AfterPaymentView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI

struct AfterPaymentView: View {
    var body: some View {
        VStack(spacing: 0){
            Image("lastIcon")
                .frame(width: 259, height: 259)
            Spacer().frame(height: 72)
            VStack(spacing: 0) {
                Text("주문해주셔서")
                    .font(.system(size: 64, weight: .light))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Text("감사합니다")
                    .font(.system(size: 64, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }
            Spacer().frame(height: 72)
            Button {
                
            } label: {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 314, height: 76)
                    .background(Color.AccentPrimary)
                    .cornerRadius(41)
                    .overlay(
                        Text("처음 화면으로")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                    )
            }
            Spacer().frame(height: 226)
            Rectangle()
                .stroke(Color(red: 0.6, green: 0.6, blue: 0.6), lineWidth: 4)
                .frame(width: 317, height: 1)
            Spacer().frame(height: 22)
            VStack(spacing: 10) {
                Text("잘못 주문하셨거나 취소를 원하시나요?")
                    .font(.system(size: 24))
                    .foregroundColor(.black.opacity(0.6))
                
                HStack(spacing: 0) {
                    Text("10초 ")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    Text("안에 ")
                        .font(.system(size: 24))
                        .foregroundColor(.TextSecondary)
                    Text("주문을 취소")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    Text("할 수 있습니다.")
                        .font(.system(size: 24))
                        .foregroundColor(.TextSecondary)
                }
                Button {
                    
                } label: {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 186, height: 48)
                        .background(Color.BackgroundSecondary)
                        .cornerRadius(41)
                        .overlay(
                            Text("주문 취소")
                                .font(.system(size: 24, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.TextTertiary)
                                .frame(width: 158, alignment: .top)
                        )
                }
                
            }
            
        }
        .padding(.top, 310)
    }
}

struct AfterPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        AfterPaymentView()
    }
}
