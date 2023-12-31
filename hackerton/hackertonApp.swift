//
//  hackertonApp.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/17.
//

import SwiftUI

@main
struct hackertonApp: App {
    @StateObject var chatGPTManager: ChatGPTManager = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(chatGPTManager)
        }
    }
}
