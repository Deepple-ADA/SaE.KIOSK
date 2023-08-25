//
//  WordTaggerView.swift
//  NC2
//
//  Created by HAN GIBAEK on 2023/08/22.
//

import SwiftUI
import CoreML



struct WordTaggerView: View {
    @State var input_text = ""
    @State var predictionTokens: [String]?
    @State var predictionLabels: [String]?
    @State var isShowingSheet = false
    
    @StateObject var wordTaggerViewModel = WordTaggerViewModel()

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading) {
                    Spacer()
                    TextField("\(input_text)", text: $input_text, axis: .vertical)
                        .foregroundColor(.black)
                    Divider()
                    Spacer()
                }
                
                OrderButtonView(wordTaggerView: self)
                
                Button {
                    tag(text: input_text)
                    wordTaggerViewModel.tag(text: input_text)
                    isShowingSheet.toggle()
                } label: {
                    Text("주문하기")
                        .foregroundColor(.black)
                        .padding(8)
                        .background() {
                            Rectangle()
                                .fill(Color.gray)
                                .cornerRadius(12)
                                .shadow(radius: 2)
                        }
                }
                .sheet(isPresented: $isShowingSheet, content: {
                    MenusView(wordTaggerViewModel: wordTaggerViewModel)
                        .presentationDetents([.fraction(0.4)])
                })
                
            }
            .padding()
        }

    }
    
    func tag(text: String) {
        do {
            let config = MLModelConfiguration()
            let model = try WordTagger1(configuration: config)
            let prediction = try model.prediction(text: text)
            
            predictionTokens = prediction.tokens
            predictionLabels = prediction.labels
        }
        catch {
            
        }
    }
}

struct MenusView: View {
    @ObservedObject var wordTaggerViewModel: WordTaggerViewModel
    var datas: [[String]]
    
    init(wordTaggerViewModel: WordTaggerViewModel) {
        self.wordTaggerViewModel = wordTaggerViewModel
        self.datas = wordTaggerViewModel.getMenus()
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 20)
                Text("주문내역")
                    .foregroundColor(.black)
                Spacer()
                    .frame(height: 40)
                ForEach(datas, id:\.self) { data in
                    HStack {
                        Text(data[0])
                            .foregroundColor(.black)
                        Spacer()
                        Text(data[1])
                            .foregroundColor(.black)
                    }
                }
                Spacer()
                    .frame(height: 20)
            }
            .padding()
        }
    }
}

struct BoxxedWordView: View {
    let text: String
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding(6)
            .background(){
                Rectangle()
                    .fill(Color.black)
                    .cornerRadius(8)
                    .shadow(radius: 20)
            }
    }
}

struct WordArrayView: View {
    let wordArray: [String]
    var body: some View {
        HStack {
            ForEach(wordArray, id: \.self) { token in
                BoxxedWordView(text: token)
            }
        }
    }
}

//struct WordTaggerView_Previews: PreviewProvider {
//    static var previews: some View {
//        WordTaggerView(result: $r)
//    }
//}
