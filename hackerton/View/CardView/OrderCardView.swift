//
//  OrderCardView.swift
//  hackerton
//
//  Created by Greed on 2023/08/25.
//

import SwiftUI

struct OrderCardView: View {
    @State private var count = 2
    @State private var price = 100_000
    
    @State private var showAlert = false
    
    let menu: MenuModel.Menu
    
    var body: some View {
        HStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 750, height: 203)
                .background(.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                .overlay(
                    HStack {
                        Image(menu.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 178, height: 178)
                        VStack{
                            Text(menu.name)
                                .font(.system(size: 48, weight: .bold))
                                .foregroundColor(.black)
                            Text("￦ \(menu.price.decimal)")
                                .font(.system(size: 36, weight: .bold))
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.gray)
                                .frame(width: 224)
                        }
                        .frame(width: 250, alignment: .leading)
                        
                        Spacer()
                        
                        VStack{
                            Stepper(value: $count){
                                Text("수량 : \(count)")
                                    .font(.system(size: 40))
                            }
                            .frame(width: 250)
                            
                            Text("총액 : ￦\(count * menu.price)")
                                .font(.system(size: 40))
                            
                        }
                        .frame(width: 280, alignment: .leading)
                        
                    }
                )
                .padding(.trailing, 20)
            
            Button {
                showAlert.toggle()
                //DB에서 삭제삭제
                
                
            } label: {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 145, height: 203)
                    .background(Color(red: 217/255, green: 217/255, blue: 217/255))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                    .overlay(
                        Image("trash")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 90)
                    )
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("주문취소"),
                            message: Text("선택한 상품을 삭제하시겠습니까?"),
                            primaryButton: .destructive(Text("삭제")) {
                                print("삭제삭제 테스트용")
                            },
                            secondaryButton: .cancel(Text("취소"))
                        )
                    }
            }
            
        }
    }
    

}

struct OrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        let menu = MenuModel.Beverage.allCases.randomElement()!.description
        OrderCardView(menu: menu)
    }
}
