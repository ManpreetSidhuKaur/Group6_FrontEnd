import Foundation

struct MoodEntry: Identifiable {
    let id = UUID()
    let day: String
    let mood: Int
}