//
//  OrderListView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI

struct OrderListView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var stack: NavigationPath
    let menu = MenuModel.Beverage.allCases.randomElement()!.description
    
    var body: some View {
        NavigationStack(path: $stack) {
            VStack {
                HStack(spacing: 200) {
                    backBtn
                    title
                    Spacer()
                }
                .padding(.leading, 35)
                .frame(alignment: .leading)
                orderMenuListView
                HStack {
                    bottomInfoView
                    Spacer()
                    goToPaymentViewBtn
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var title: some View {
        Text("주문 목록")
            .font(.system(size: 48, weight: .bold))
            .foregroundColor(.black)
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
    
    private var orderMenuListView: some View {
        ScrollView{
            LazyVStack(alignment: .center){
                //cart: [MenuVO]를 ForEach로 돌려야할듯
                    ForEach(0..<3) { _ in // 원하는 숫자로 변경
                        OrderCardView(menu: menu)
                    }
                }
            }
            .padding(.top, 60)
            .background(
                RoundedRectangle(cornerRadius: 32)
                        .foregroundColor(.clear)
                        .background(Color.BackgroundSecondary)
                        .frame(width: 960, height: 1006)
            )
    }
    
    private var bottomInfoView: some View {
        HStack(spacing: 27) {
            Image("smileIcon")
            Text("₩ 100,000")
                .font(.system(size: 64, weight: .bold))
                .foregroundColor(.black)
        }
        .padding(.leading, 35)
    }
    
    private var goToPaymentViewBtn: some View {
        NavigationLink {
            PaymentView(stack: $stack)
        } label: {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 74))
                    .foregroundColor(.white)
                Text("결제")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width: 276, height: 118)
            .background(Color.AccentSecondary)
            .cornerRadius(32)
            .padding(.trailing, 29)
        }
    }
    
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(stack: .constant(NavigationPath()))
    }
}
