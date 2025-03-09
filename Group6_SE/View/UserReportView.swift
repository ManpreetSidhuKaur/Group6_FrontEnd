//
//  UserReportView.swift
//  Group6_SE
//
//  Created by pk on 2025-03-09.
//


import SwiftUI
import Charts

struct UserReportView: View {
    let weeklyMoodData: [MoodEntry] = [
        MoodEntry(day: "Mon", mood: 3),
        MoodEntry(day: "Tue", mood: 4),
        MoodEntry(day: "Wed", mood: 2),
        MoodEntry(day: "Thu", mood: 5),
        MoodEntry(day: "Fri", mood: 3),
        MoodEntry(day: "Sat", mood: 4),
        MoodEntry(day: "Sun", mood: 5)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("User Report").font(.title2).bold()
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Name: Robert Frye")
                Text("Mood: Fair")
                Text("Progress: Good")
                Text("Recommended Exercises: Meditation and rest")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            
            Text("Weekly Mood Trend").font(.headline).padding(.top)
            
            Chart(weeklyMoodData) { entry in
                BarMark(
                    x: .value("Day", entry.day),
                    y: .value("Mood", entry.mood)
                )
                .foregroundStyle(entry.mood >= 4 ? Color.green : Color.red.opacity(0.8))
            }
            .frame(height: 200)
        }
        .padding()
    }
}
