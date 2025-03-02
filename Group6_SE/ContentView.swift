//
//  ContentView.swift
//  Group6_SE
//
//  Created by manpreet kaur on 2025-03-01.
//

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
                    destination: HelloWorldView(),
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

// Destination View
struct HelloWorldView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

