import SwiftUI

struct LoginView: View {
    @State private var email: String = "joe@gmail.com"
    @State private var password: String = "123"
    @State private var errorMessage: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                NavigationLink(
                    destination: AIChatView(),
                    isActive: $isLoggedIn
                ) {
                    EmptyView()
                }

                Button(action: login) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
            }
            .padding()
        }
    }

    func login() {
        if email == "joe@gmail.com" && password == "123" {
            isLoggedIn = true
        } else {
            errorMessage = "Invalid email or password."
        }
    }
}

struct AIChatView: View {
    @State private var userInput: String = ""
    @State private var aiResponse: String = "Hello! How can I assist you today?"
    @State private var isLoading: Bool = false
    
    let apiKey = "AIzaSyDxrawSiwNWeyZtoCNIynBH-CE7Ns4b-Zc" // 🔴 Replace with your actual key

    var body: some View {
        VStack {
            Text("Gemini AI Chat")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            ScrollView {
                Text(aiResponse)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .frame(height: 200)

            TextField("Type your message...", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: fetchAIResponse) {
                Text("Send")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            if isLoading {
                ProgressView()
                    .padding()
            }

            Spacer()
        }
        .padding()
    }

    func fetchAIResponse() {
        guard !userInput.isEmpty else { return }

        // Show loading state
        isLoading = true

        let apiURL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=\(apiKey)"
        let requestBody: [String: Any] = [
            "contents": [
                [
                    "parts": [
                        ["text": userInput]
                    ]
                ]
            ]
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else { return }

        var request = URLRequest(url: URL(string: apiURL)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false // Hide loading spinner
            }

            if let error = error {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    aiResponse = "Failed to get response. Try again."
                }
                return
            }

            if let data = data, let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let contents = jsonResponse["contents"] as? [[String: Any]],
               let parts = contents.first?["parts"] as? [[String: Any]],
               let text = parts.first?["text"] as? String {
                DispatchQueue.main.async {
                    aiResponse = text
                }
            } else {
                DispatchQueue.main.async {
                    aiResponse = "Failed to get response. Try again."
                }
            }
        }.resume()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
