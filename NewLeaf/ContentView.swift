//
//  ContentView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/26/22.
//

import SwiftUI
import Firebase
import Foundation


/* To read or write data from the database, you need an instance of FIRDatabaseReference:

 var ref: DatabaseReference!

 ref = Database.database().reference()
 */
struct ContentView: View {

        // CREATE //
        /*  Sets the value in the db.
    self.ref.child("users").child(user.uid).setValue(["username": username])
        */
        /* Using setValue in this way overwrites data at the specified location, including any child nodes. However, you can still update a child without rewriting the entire object. If you want to allow users to update their profiles you could update the username as follows:
         self.ref.child("users/\(user.uid)/username").setValue(username)
         */

        // READ //
        /*
         You can use the FIRDataEventTypeValue event to read the data at a given path, as it exists at the time of the event. This method is triggered once when the listener is attached and again every time the data, including any children, changes. The event callback is passed a snapshot containing all data at that location, including child data. If there is no data, the snapshot will return false when you call exists() and nil when you read its value property.

         refHandle = postRef.observe(DataEventType.value, with: { snapshot in
          // ...
        })
        */

    @State private var username = ""
    @State private var userEmail = ""
    @State private var userPassword = ""
    @State private var userLocation = ""
    @State var isLoginMode = false
    @ObservedObject var model = viewUserModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 16) {
                    Image("NewLeaf (2)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                    
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    } .pickerStyle(SegmentedPickerStyle())
                    
                    
                    if !isLoginMode {
                        
                        Section {
                            TextField("Username", text: $username )
                                .padding(12)
                                .background(Color.white)
                        }

                        Section {
                            TextField("Location", text: $userLocation)
                                .padding(12)
                                .background(Color.white)
                        }
                    }

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
                }
                .padding()
                .background(Color(.init(white: 0, alpha: 0.05)))
                        .ignoresSafeArea()
            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
    
        }

    }

    private func handleAction() {
        if isLoginMode {
            print("Should log into Firebase with existing creds")
        } else {
            // call add data
            model.addData(username: username, email: userEmail, password: userPassword, location: userLocation)
            username = ""
            userEmail = ""
            userPassword = ""
            userLocation = ""
            print("Registers a new account inside Firebase Auth and then stores image in storage somehow")
        }
    }


    
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

