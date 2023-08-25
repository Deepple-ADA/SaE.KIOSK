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
    @State var outputText = ""
    
    var body: some View {
        Button{
            print(outputText)
        } label: {
            VStack(spacing: 28) {
                HStack(spacing: 40) {
                    Image("soundEffect")
                        .padding()
                    Spacer()
                    Text(outputText)
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                    Spacer()
                }
                .foregroundColor(.clear)
                .frame(width: 960, height: 168)
                .background(Color.BackgroundSecondary)
                .cornerRadius(32)
                
                OrderButtonView(view: self)
                
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
}


struct RecommendView_Previews: PreviewProvider {
    @Binding var outputText: String
    static var previews: some View {
        RecommendView()
    }
}
