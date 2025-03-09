//
//  ProfileViewModel.swift
//  Group6_SE
//
//  Created by pk on 2025-03-09.
//


import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var selectedMood: String = "Neutral"
    let moods = ["Great", "Good", "Neutral", "Bad", "Terrible"]
}