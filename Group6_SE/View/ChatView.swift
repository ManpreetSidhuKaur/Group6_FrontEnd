//
//  ChatView.swift
//  Group6_SE
//
//  Created by pk on 2025-03-09.
//


import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.chatHistory, id: \ .self) { message in
                Text(message)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            }
            
            HStack {
                TextField("Type a message...", text: $viewModel.message)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                
                Button("Send") {
                    viewModel.sendMessageToAI()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 3)
            }
            .padding()
        }
    }
}
