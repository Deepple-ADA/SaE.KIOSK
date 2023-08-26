//
//  RecommendView.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/26.
//

import Foundation
import SwiftUI

struct RecommendView: View, STTModelProtocol {
    @StateObject private var speechManager = SpeechManager()
    @EnvironmentObject var chatGPTManager: ChatGPTManager
    //    @StateObject var viewModel = ViewModel()
    
    @Binding var isRecommend: Bool
    
    @State var outputText = ""
    @State var cart: [MenuVO] = []
    @Binding var order: String
    //let menu = MenuModel.Menu
    var tmp: [String] = []
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 28) {
                    if let tmp = (chatGPTManager.messages.last?.content.components(separatedBy: ", ")) {
                        ForEach(tmp, id: \.self) { mes in
                            //                        RecommendCardView(menu: "", productTitle: mes, cart: $cart)
                            
                            if let snack = MenuModel.Snack(rawValue: mes) {
                                RecommendCardView(menu: snack.description, cart: $cart, productTitle: mes)
                            } else if let coffee = MenuModel.Coffee(rawValue: mes) {
                                RecommendCardView(menu: coffee.description, cart: $cart, productTitle: mes)
                            } else if let beverage = MenuModel.Beverage(rawValue: mes) {
                                RecommendCardView(menu: beverage.description, cart: $cart, productTitle: mes)
                            }
                            
                            Divider().onAppear {
                                print("\(mes)")
                            }
                        } }
                }
            }
            
            
            //                RecommendCardView(message: $chatGPTManager.messages.last ?? .constant(Message(id: .init(), role: .user, content: "결과 없습니당.. :)")))
            //                }
            //                Rectangle()
            //                    .overlay(
            //                        Text(order)
            //                            .foregroundColor(.blue)
            //                            .font(.system(size: 50))
            //                    )
            //                    .foregroundColor(.clear)
            //                    .background(Color.BackgroundSecondary)
            //                    .cornerRadius(32)
            
            HStack(spacing: 40) {
                STTManager(isRecommend: $isRecommend, view: self)
                    .padding()
                Spacer()
                Text(outputText)
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                Spacer()
            }
            .foregroundColor(.clear)
            .background(Color.BackgroundSecondary)
            .cornerRadius(32)
            
        }
        //        .onAppear(
        //           tmp = chatGPTManager.messages.last?.content.components(separatedBy: ", ") ?? ""
        //        )
    }
    
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user {
                Spacer()
            } else {
                Text(message.content)
                    .foregroundColor(message.role == .user ? .black : .white)
                    .padding()
                    .background(message.role == .assistant ? .blue : .gray.opacity(0.1))
                    .cornerRadius(16)
            }
            
        }
    }
}


//struct RecommendView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendView()
//    }
//}
