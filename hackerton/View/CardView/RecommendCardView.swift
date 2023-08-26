//
//  MenuCardView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI
import Foundation

struct RecommendCardView: View {
    @State var isSelected : Bool = false
    @EnvironmentObject var chatGPTManager: ChatGPTManager
    let menu: MenuModel.Menu
    
    @Binding var cart: [MenuVO]
    
    @State private var productName: String = ""
    @State private var price: Int = 0
    @State private var amount: Int = 1
//    @Binding var message: Message
    var productTitle: String

    var body: some View {
        
        Button {
            cart.append(MenuVO(productName: menu.name, price: menu.price, amount: amount))
            print(cart)
            productName = ""
            price = 0
            amount = 1
            //Optional(["왕뚜껑", " 육개장", " 진라면", " 튀김우동"])
            //여기서 

        } label: {
            HStack {
                Image(menu.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 178, height: 178)
                VStack(alignment: .leading) {
                    Text(chatGPTManager.messages.last?.content ?? "내용 없어요")
                        .foregroundColor(.white)
                    Text(productTitle)
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.black)
                    Text(menu.desc)
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .frame(width: 224, alignment: .topLeading)
                    Text("₩ \(menu.price.decimal)")
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color.PointPrimary)
                        .frame(width: 224, alignment: .topTrailing)
                }
                .padding(.trailing, 28)
            }
            .frame(width: 431, height: 203)
            .background(isSelected ? Color.AccentSecondary : .white)
            .cornerRadius(16)
            .shadow(color: isSelected ? .black.opacity(0.15) : .black.opacity(0.01), radius: 8, x: 0, y: 4)
        }
    }
    
}

//struct MenuCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuCardView(MenuModel.Snack.마가렛드)
//    }
//}
