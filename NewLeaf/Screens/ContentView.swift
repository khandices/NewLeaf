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

    @State private var userEmail = ""
    @State private var userPassword = ""
    
    @State var isLoginMode = false
    
    @ObservedObject var model = viewUserModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 16) {
                    Image("NewLeaf (2)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                    
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    } .pickerStyle(SegmentedPickerStyle())
                    
                
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


                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account!")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                            Spacer()
                        } .background(Color.green)
                    }
                    Text(self.loginStatusMessage)
                        .foregroundColor(.red)
                }
                .padding()
                .background(Color(.init(white: 0, alpha: 0.05)))
                        .ignoresSafeArea()
            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white:0, alpha: 0.05))
                            .ignoresSafeArea())
        }
    

    }
    
    
    @State var loginStatusMessage = ""
    @State var userID = ""
    
    private func createAccount() {
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("Failed to create user:" , error)
                self.loginStatusMessage = "Failed to create user: \(error)"
                return
            }
            userID = result?.user.uid ?? ""
            self.loginStatusMessage = "Successfully created user: \(userID)"
        }
            
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("Failed to login user:" , error)
                self.loginStatusMessage = "Failed to login user: \(error)"
                return
            }
            self.loginStatusMessage = "\(userEmail) successfully logged in!"
        }
    }
    
    
   
    private func handleAction() {
        if isLoginMode {
            loginUser()
        } else {
            createAccount()
            model.addUser(id: userID, email: userEmail)
            userEmail = ""
            print("Registers a new account inside Firebase Auth and then stores image in storage somehow")
        }
    }


    
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

