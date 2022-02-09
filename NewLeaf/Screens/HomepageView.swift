//
//  LoadingView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/3/22.
//

import Foundation
import FirebaseAuth
import Firebase
import SwiftUI






struct CurrentUser: Identifiable {
    var id, email, username, bio, location: String
//    @Published var uid: String = ""
//    @Published var email: String = ""
//    @Published var username: String = ""
//    @Published var bio: String = ""
//    @Published var location: String = ""

    init(id: String , email: String, username: String, bio: String, location: String) {
        self.id = id
        self.email = email
        self.username = username
        self.bio = bio
        self.location = location
    }
}

class viewUserProfileModel: ObservableObject {

    @Published var errorMessage = ""
    var currentUser = CurrentUser(id: "test" , email: "test", username: "test", bio: "", location: "")

    init() {
        fetchCurrentUser()
    }
    private func fetchCurrentUser() {

        guard let userData = Auth.auth().currentUser?.uid
        else {
            self.errorMessage = "Could not find Firebase uid"
            return

        }
        let db = Firestore.firestore()
        db.collection("users").document(userData).getDocument { snapshot, error in
            if let error = error {
                print("Failed to fetch current user", error)
                return
            }
            guard let data = snapshot?.data() else { return }
            let uid = data["uid"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let username = data["username"] as? String ?? ""
            let bio = data["bio"] as? String ?? ""
            let location = data["location"] as? String ?? ""
            self.currentUser = CurrentUser(id: uid , email: email, username: username, bio: bio, location: location)
            print(self.currentUser.id)
        }

    }
}

struct HomepageView: View {
   
    @StateObject var vm = viewUserProfileModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Loading???????")
//                Text("CURRENT USER ID: \(vm.currentUser.id)")
                
                NavigationLink(destination: MarketplaceView(), label: {
                    Spacer()
                    Text("Marketplace")
                        .padding(.vertical, 10)
                        .frame(width: 200)
                        .background(Color.green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    Spacer()
                })
                
                NavigationLink(destination: UserProfileView(), label: {
                    Spacer()
                    Text("My Profile")
                        .padding(.vertical, 10)
                        .frame(width: 200)
                        .background(Color.green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    Spacer()
                })
            }
        }
        .environmentObject(vm)
    }
        
}

    

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
            HomepageView()
    }
}


    

