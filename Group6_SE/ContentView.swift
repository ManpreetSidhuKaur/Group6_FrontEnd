import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        NavigationView {
            LoginView()
                .navigationBarHidden(true)
        }
    }
}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Welcome to Mind Mate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)

                VStack(spacing: 15) {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    NavigationLink(destination: ProfileView()) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.horizontal)
            }
        }
    }
}

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
                        ForEach(moods, id: \ .self) { mood in
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
        ZStack {
            Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("User Report")
                    .font(.title2)
                    .bold()
                
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
                
                Text("Weekly Mood Trend")
                    .font(.headline)
                    .padding(.top)
                
                Chart(weeklyMoodData) { entry in
                    BarMark(
                        x: .value("Day", entry.day),
                        y: .value("Mood", entry.mood)
                    )
                    .foregroundStyle(entry.mood >= 4 ? Color.green : Color.red.opacity(0.8))
                }
                .frame(height: 200)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 3)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct MoodEntry: Identifiable {
    let id = UUID()
    let day: String
    let mood: Int
}

struct ChatView: View {
    @State private var message = ""
    @State private var chatHistory = ["Hi, I'm not feeling very good today.", "What seems to be the problem?"]
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack {
                List(chatHistory, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                
                HStack {
                    TextField("Type a message...", text: $message)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    
                    Button("Send") {
                        sendMessageToAI()
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
    
    func sendMessageToAI() {
        guard !message.isEmpty else { return }
        chatHistory.append("You: \(message)")
        message = ""

        // Simulated AI response (Replace this with real API call)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            chatHistory.append("AI: I'm here to help, tell me more.")
        }
    }
}
