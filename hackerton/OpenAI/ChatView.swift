//
//  ChatView.swift
//  hackerton
//
//  Created by Greed on 2023/08/26.
//

import SwiftUI

public struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()

    public init() { }
    public var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                        messageView(message: message)
                    }

                }
                .padding()

            }
            .onAppear {
//                let results = Self.store.projects
//                    .filter { $0.isSelected.value }
//                    .map { ProjectResultEntity(project: $0) }
//                guard let result = results.first else {
//                    return
//                }
                viewModel.messages = [
                    .init(id: UUID(), role: .assistant, content: "ass1", createAt: Date()),
                    .init(id: UUID(), role: .system, content: "sys1", createAt: Date()),
                    .init(id: UUID(), role: .user, content: "user1", createAt: Date()),
                ]
                viewModel.sendMessage()
            }

        }
        .padding()

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

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
