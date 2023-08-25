//
//  MenuView.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(spacing: 28) {
            HStack(spacing: 40) {
                MenuTypeCardView()
                MenuTypeCardView()
                MenuTypeCardView()
            }
            .foregroundColor(.clear)
            .frame(width: 960, height: 168)
            .background(Color.BackgroundSecondary)
            .cornerRadius(32)
            
            Rectangle()
                .overlay(
                    Text("lazy V Grid View")
                        .foregroundColor(.blue)
                )
                .foregroundColor(.clear)
                .frame(width: 960, height: 873)
                .background(Color.BackgroundSecondary)
                .cornerRadius(32)
            
            HStack(spacing: 28){
                HStack(spacing: 32){
                    Image("smileFace")
                        .resizable()
                        .frame(width: 117, height: 117)
                    VStack(spacing: 13) {
                        Text("화면을 바라보고 이렇게 말씀해보세요")
                            .font(.system(size: 24))
                            .foregroundColor(.TextSecondary)
                        Text("""
                        새우깡 하나 담기
                        땅콩이 들어가지 않은 메뉴 추천
                        커피 메뉴 보기
                        """)
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.Textprimary)
                    }
                }
                .foregroundColor(.clear)
                .frame(width: 618, height: 156)
                .background(Color.BackgroundSecondary)
                .cornerRadius(32)
                
                ZStack {
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
                            Text("항목 없음")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white.opacity(0.6))
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .foregroundColor(.clear)
                .frame(width: 314, height: 156)
                .background(Color.TextTertiary)
                .cornerRadius(32)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
