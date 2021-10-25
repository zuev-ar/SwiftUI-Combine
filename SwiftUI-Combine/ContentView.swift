//
//  ContentView.swift
//  SwiftUI-Combine
//
//  Created by Arkasha Zuev on 25.10.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userViewModel = UserViewModel()
    @State var presentAlert = false
    
    var body: some View {
        Form {
            Section(footer: Text(userViewModel.usernameMessage).foregroundColor(.red)) {
                TextField("Username", text: $userViewModel.username)
                    .autocapitalization(.none)
            }
            Section(footer: Text(userViewModel.passwordMessage).foregroundColor(.red)) {
                TextField("Password", text: $userViewModel.password)
                TextField("Password again", text: $userViewModel.passwordAgin)
            }
            Section {
                Button {
                    singUp()
                } label: {
                    Text("Sign up")
                }
                .disabled(self.userViewModel.isValid)
            }
        }
        .sheet(isPresented: $presentAlert) {
            WelcomeView()
        }
    }
    
    func singUp() {
        self.presentAlert = true
    }
}

struct WelcomeView: View {
    var body: some View {
        Text("Welcome! Great to have you on board!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
