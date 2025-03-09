import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
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
                
                Picker("Mood", selection: $viewModel.selectedMood) {
                    ForEach(viewModel.moods, id: \ .self) { mood in
                        Text(mood)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Text("Current Mood: \(viewModel.selectedMood)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .bold()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 3)
        }
        .padding()
    }
}
