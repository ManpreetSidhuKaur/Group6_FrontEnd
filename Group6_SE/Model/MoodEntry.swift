//
//  MoodEntry.swift
//  Group6_SE
//
//  Created by pk on 2025-03-09.
//


import Foundation

struct MoodEntry: Identifiable {
    let id = UUID()
    let day: String
    let mood: Int
}