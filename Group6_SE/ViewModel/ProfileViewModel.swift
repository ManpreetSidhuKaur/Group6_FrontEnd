import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var selectedMood: String = "Neutral"
    let moods = ["Great", "Good", "Neutral", "Bad", "Terrible"]
}