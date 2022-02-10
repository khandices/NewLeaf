//
//  CreateUserView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/5/22.
//

import Foundation
import FirebaseAuth
import Firebase
import SwiftUI


struct CreateUserView: View {

    @State private var userEmail = ""
    @State private var userPassword = ""
   
    @ObservedObject var model = viewUserModel()
    
    var body: some View {
        ScrollView {
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

                Button {
                        createAccount()
                } label: {
                    HStack {
                        Spacer()
                        Text("Create Account")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                        Spacer()
                    } .background(Color.green)
                        .cornerRadius(10)
                        .frame(width: 200)
                    
                }
                Text(self.createUserStatusMessage)
                    .foregroundColor(.red)
            }
            .padding()
            .background(Color(.init(white: 0, alpha: 0.05)))
                    .ignoresSafeArea()
        }

    }
    
    
    @State var createUserStatusMessage = ""
    @State var userID = ""
    
    private func createAccount() {
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("Failed to create user:" , error)
                self.createUserStatusMessage = "Failed to create user: \(error)"
                return
            }
            userID = result?.user.uid ?? ""
            print(userID)
            self.createUserStatusMessage = "Successfully created user: \(userID)"
            model.addUser(id: userID, email: userEmail)
            userEmail = ""
            userPassword = ""
            
        }
            
    }
    
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}

