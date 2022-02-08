//
//  ContentView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/26/22.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseAuth


 
struct ContentView: View {

    var body: some View {
        NavigationView{
            LoginView()
        }
    }
}
    
struct LoginView: View {
    
    

    
    @State private var userEmail = ""
    @State private var userPassword = ""
    @State private var isLoginMode = false
   
    
    var body: some View {
        ScrollView{
            VStack (spacing: 16) {
                Image("NewLeaf (2)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 180)
                
                Section {
                    TextField("Email", text: $userEmail)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(12)
                        .background(Color.white)
                }
                Section {
                    SecureField("Password", text: $userPassword)
                        .padding(12)
                        .background(Color.white)
                }
                Button("Log in") {
                    loginUser()
                    isLoginMode.toggle()
                }
                .fullScreenCover(isPresented: $completedLogin) {
                    HomepageView()
                }
                 .padding(.vertical, 10)
                 .frame(width: 200)
                 .background(Color.green)
                 .cornerRadius(10)
                    .foregroundColor(.white)
                    
                

                    
                Text(self.loginStatusMessage)
                    .foregroundColor(.red)
            
            NavigationLink(destination: CreateUserView(), label: {
                Text("Not a user? Create an account here")
                    .bold()
            })
            }
            .padding()
            .background(Color(.init(white: 0, alpha: 0.05)))
                        .ignoresSafeArea()
        }
    }
            
    @State private var completedLogin = false
    @State var loginStatusMessage = ""
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("Failed to login user:" , error)
                self.loginStatusMessage = "Failed to login user: \(error)"
                return
            } else {
            self.loginStatusMessage = "\(userEmail) successfully logged in!"
            self.completedLogin.toggle()
            }
    
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}


