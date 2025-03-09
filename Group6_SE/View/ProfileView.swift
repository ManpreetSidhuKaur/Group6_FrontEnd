//
//  ProfileView.swift
//  Group6_SE
//
//  Created by pk on 2025-03-09.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedMood: String = "Neutral"
    
    let moods = ["Great", "Good", "Neutral", "Bad", "Terrible"]
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.blue)
                    .shadow(radius: 5)
                
                VStack(spacing: 8) {
                    Text("Robert Frye").font(.title2).bold()
                    Text("robertfrye@gmail.com").foregroundColor(.gray)
                    Text("Age: 21 | Gender: Male").foregroundColor(.gray)
                }
                
                VStack(spacing: 10) {
                    Text("How are you feeling today?")
                        .font(.headline)
                    
                    Picker("Mood", selection: $selectedMood) {
                        ForEach(moods, id: \.self) { mood in
                            Text(mood)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    Text("Current Mood: \(selectedMood)")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .bold()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 3)
                
                VStack(spacing: 15) {
                    NavigationLink(destination: UserReportView()) {
                        Text("View Report")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                    
                    NavigationLink(destination: ChatView()) {
                        Text("Chat with AI")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                }
                .padding()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding(.horizontal)
        }
    }
}

