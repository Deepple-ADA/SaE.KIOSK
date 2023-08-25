//
//  RecommendView.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/26.
//

import Foundation
import SwiftUI

struct RecommendView: View {
    
    var body: some View {
        VStack(spacing: 28) {
            HStack(spacing: 40) {
                Image("soundEffect")
                    .padding()
                Spacer()
                Text("바니베니바니베니 당근명근")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                Spacer()
            }
            .foregroundColor(.clear)
            .frame(width: 960, height: 168)
            .background(Color.BackgroundSecondary)
            .cornerRadius(32)
            
            Rectangle()
                .overlay(
                    Text("chatGPT API를 쓰거나 추천해주는 것을 cardView로 연결해야함다")
                        .foregroundColor(.blue)
                        .font(.system(size: 50))
                )
                .foregroundColor(.clear)
                .frame(width: 960, height: 873)
                .background(Color.BackgroundSecondary)
                .cornerRadius(32)
            
        }
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView()
    }
}
