//
//  ChatViewModel.swift
//  hackerton
//
//  Created by Greed on 2023/08/26.
//
import Foundation


class ChatGPTManager: ObservableObject {
    @Published var messages: [Message] = [Message(id: UUID(), role: .system, content: GPTRequestDataSource.preprompt)]
    private let openAIService = OpenAIService()
    
    func sendMessage(input: String) {
        let newMessage = Message(id: UUID(), role: .user, content: input)
        messages.append(newMessage)
        
        Task {
            do {
                let response = try await openAIService.sendMessage(messages: messages)
                guard let receivedOpenAIMessage = response.choices.first?.message else {
                    print("Had no received message")
                    return
                }
                
                let receivedMessage = Message(id: UUID(), role: receivedOpenAIMessage.role, content: receivedOpenAIMessage.content)
                
                DispatchQueue.main.async {
                    self.messages.append(receivedMessage)
                }
            } catch {
                print("Error: \(error)")
                // Handle the error as per your application's requirements
            }
        }
    }
    
}

struct Message: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
}
