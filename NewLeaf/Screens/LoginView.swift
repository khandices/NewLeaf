//
//  LoginView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/10/22.
//



import SwiftUI
import Firebase
import Foundation
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var userEmail = ""
    @State private var userPassword = ""
   
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
   
    var body: some View {
        NavigationView {
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
                            .background(lightGreyColor)
                    }
                    Section {
                        SecureField("Password", text: $userPassword)
                            .padding(12)
                            .background(lightGreyColor)
                    }
                    Button("Log in") {
                        withAnimation {
                            loginUser()
                            print("Navigating to Homepage")
                        }
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
            }
//            .background(Color(.green))
//                .ignoresSafeArea()
        }
    }
            
    
    @State var loginStatusMessage = ""
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                print("Failed to login user:" , error)
                self.loginStatusMessage = "Failed to login user: \(error)"
                return
            } else {
            self.loginStatusMessage = "\(userEmail) successfully logged in!"
            viewRouter.currentPage = .page2
            }
    
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
       LoginView().environmentObject(ViewRouter())
            
    }
}
