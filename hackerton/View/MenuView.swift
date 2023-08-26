//
//  MenuView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI
import Foundation
import CoreML


struct MenuView: View, STTModelProtocol {
    @StateObject private var speechManager = SpeechManager()
    @State var outputText = ""
    
    @State private var selectedProductType: MenuModel.ProductType? = MenuModel.ProductType.allCases.first
    @Binding var isLinkActive: Bool
    let columns = [
        GridItem(.adaptive(minimum: 431))
    ]
    
    @State var cart: [MenuVO] = []
    

    var body: some View {
        VStack(spacing: 28) {
            menuTypeView
            menuListView

            HStack(spacing: 28){
                infoView
                goToOrderListBtn
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var menuTypeView: some View {
        HStack(spacing: 40) {
            ForEach(MenuModel.ProductType.allCases) { productType in
                MenuTypeCardView(selectedProductType: $selectedProductType, productType: productType)
            }
        }
        .foregroundColor(.clear)
        .frame(width: 960, height: 168)
        .background(Color.BackgroundSecondary)
        .cornerRadius(32)
    }
    
    private var menuListView: some View {
        Rectangle()
            .overlay(
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 32) {
                        if let selectedProductType = selectedProductType {
                            switch selectedProductType {
                            case .snack:
                                ForEach(MenuModel.Snack.allCases) {snack in
                                    MenuCardView(menu: snack.description, cart: $cart)
                                }
                            case .coffee:
                                ForEach(MenuModel.Coffee.allCases) {coffee in
                                    MenuCardView(menu: coffee.description, cart: $cart)
                                }
                            case .beverage:
                                ForEach(MenuModel.Beverage.allCases) {beverage in
                                    MenuCardView(menu: beverage.description, cart: $cart)
                                }
                            }
                        }
                    }
                }
                    .padding(.top, 34)
            )
            .foregroundColor(.clear)
            .frame(width: 960, height: 873)
            .background(Color.BackgroundSecondary)
            .cornerRadius(32)
    }
    
    private var infoView: some View {
        VStack {
            HStack(spacing: 32) {
                Button {

                    
                } label: {
                    STTManager(view: self)
                        .offset(x:0, y: -15)
                    
                }
                VStack(spacing: 13) {
                    Text("\(outputText)----")
                        .font(.system(size: 24))
                        .foregroundColor(.TextSecondary)
                    Text("""
                         새우깡 하나 담기
                         땅콩이 들어가지 않은 메뉴 추천
                         커피 메뉴 보기
                         """)
                    
                    
                    Text("\(outputText)----")
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.Textprimary)
                }
                
            }
            .foregroundColor(.clear)
            .frame(width: 618, height: 156)
            .background(Color.BackgroundSecondary)
            .cornerRadius(32)
            
        }
    }
    
    
    
    private var goToOrderListBtn: some View {
        NavigationLink(destination: OrderListView(isLinkActive: $isLinkActive, cart: $cart)) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 314, height: 156)
                .background(cart.isEmpty ? Color.TextTertiary : Color.AccentPrimary)
                .cornerRadius(32)
                .overlay(
                    HStack(spacing: 26) {
                        Image("orderList")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 68, height: 86)
                        VStack(spacing: 1) {
                            Text("주문목록")
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.white)
                            Image("line")
                                .foregroundColor(.clear)
                                .frame(width: 132, height: 2)
                                .background(Color.TextSecondary)
                            Spacer().frame(height: 2)
                            Text(cart.isEmpty ? "항목 없음" : "\(cart.count)개 항목 결제")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white.opacity(0.6))
                                .multilineTextAlignment(.center)
                        }
                    }
                )
        }
        
    }
    
    
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView(isLinkActive: .constant(true), outputText: "", stack: .constant(NavigationPath()))
//    }
//}
