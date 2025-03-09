//
//  ChatViewModel.swift
//  Group6_SE
//
//  Created by pk on 2025-03-09.
//


import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var message = ""
    @Published var chatHistory = ["Hi, I'm not feeling very good today.", "What seems to be the problem?"]
    
    func sendMessageToAI() {
        guard !message.isEmpty else { return }
        chatHistory.append("You: \(message)")
        message = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.chatHistory.append("AI: I'm here to help, tell me more.")
        }
    }
}