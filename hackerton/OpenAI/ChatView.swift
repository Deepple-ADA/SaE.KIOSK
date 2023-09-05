////
////  ChatView.swift
////  hackerton
////
////  Created by Greed on 2023/08/27.
////
//
//import SwiftUI
//
//public struct ChatView: View {
//    @StateObject var viewModel = ViewModel()
//
//    public init() { }
//    public var body: some View {
//        VStack {
//            ScrollView {
//                LazyVStack {
//                    ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
//                        messageView(message: message)
//                    }
//
//                }
//                .padding()
//
//            }
//            HStack {
//                TextField("text here...", text: $viewModel.currentInput)
//                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
//                    .background(
//                        RoundedRectangle(cornerRadius: 8)
//                            .foregroundColor(.white)
//                            .frame(height: 48)
//                    )
//                Button {
//                    viewModel.sendMessage()
//                } label: {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 8)
//                            .foregroundColor(.black)
//                            .frame(width: 80, height: 48)
//                        Text("Send")
//                            .foregroundColor(.white)
//                    }
//                }
//            }
//        }
//        .padding()
//
//    }
//    func messageView(message: Message) -> some View {
//        HStack {
//            if message.role == .user {
//                Spacer()
//            } else {
//                Text(message.content)
//                    .foregroundColor(message.role == .user ? .black : .white)
//                    .padding()
//                    .background(message.role == .assistant ? .blue : .gray.opacity(0.1))
//                    .cornerRadius(16)
//            }
//
//        }
//    }
//
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
