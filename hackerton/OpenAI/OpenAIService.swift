//
//  OpenAIService.swift
//  hackerton
//
//  Created by Greed on 2023/08/26.
//
import Foundation

struct OpenAIService {
    private let endpointUrl = "https://api.openai.com/v1/chat/completions"

    func sendMessage(messages: [Message]) async throws -> OpenAIChatResponse {
        print("haha")
        let apiKey = OpenaiAPIKey.apiKey

        let openAIMessages = messages.map { OpenAIChatMessage(role: $0.role, content: $0.content) }
        let body = OpenAIChatBody(
            model: "gpt-3.5-turbo",
            messages: openAIMessages,
            temperature: 1,
            max_tokens: 50,
            top_p: 1
        )

        guard let url = URL(string: endpointUrl) else {
            throw NSError(domain: "InvalidURL", code: 0, userInfo: nil)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let jsonData = try JSONEncoder().encode(body)
        request.httpBody = jsonData

        let (data, response) = try await URLSession.shared.data(for: request)
        print(data, response)
        return try JSONDecoder().decode(OpenAIChatResponse.self, from: data)
    }

}

struct OpenAIChatBody: Encodable {
    let model: String
    let messages: [OpenAIChatMessage]
    let temperature: Float?
    let max_tokens: Int?
    let top_p: Float?
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}

struct OpenAIChatResponse: Decodable {
    let choices: [OpenAIChatChoice]
}

extension OpenAIChatResponse {
    struct OpenAIChatChoice: Decodable {
        let message: OpenAIChatMessage
    }
}
