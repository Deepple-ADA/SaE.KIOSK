//
//  OrderListView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI

struct OrderListView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var isLinkActive: Bool
    let menu = MenuModel.Beverage.allCases.randomElement()!.description
    @Binding var cart: [MenuVO]
    
    var body: some View {
        VStack {
            HStack(spacing: 200) {
                backBtn
                title
                Spacer()
            }
            .padding(.leading, 35)
            .padding(.top, 66)
            .frame(alignment: .leading)
            orderMenuListView
            HStack {
                bottomInfoView
                Spacer()
                goToPaymentViewBtn
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
                ForEach($cart, id: \.self) { item in
                    OrderCardView(item: item, cart: $cart)
                }
            }
            .padding(.top, 60)
            .background(
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color.BackgroundSecondary)
                    .frame(width: 960, height: 1006)
            )
        }
        
    }
    private var bottomInfoView: some View {
        HStack(spacing: 27) {
            LottieView(filename: "logo")
                .frame(width: 86, height: 86)
                .background(
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 118, height: 118)
                    .background(Color(red: 0.94, green: 0.95, blue: 0.96))
                    .cornerRadius(32)
                )
            Text("₩ 100,000")
                .font(.system(size: 64, weight: .bold))
                .foregroundColor(.black)
        }
        .padding(.leading, 45)
    }
    
    private var goToPaymentViewBtn: some View {
        NavigationLink(destination: PaymentView(isLinkActive: $isLinkActive)) {
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
    
    func calculateTotal(menuArray: [MenuVO]) -> Int {
        return menuArray.reduce(0) { $0 + ($1.price * $1.amount) }
    }
}

//struct OrderListView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderListView(isLinkActive: .constant(true))
//    }
//}
//
