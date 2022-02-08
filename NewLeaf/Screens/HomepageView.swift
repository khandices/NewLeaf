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


struct CurrentUser {
    let uid, email, username, bio, location: String
}

class viewUserProfileModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var currentUser: CurrentUser?
    
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
            self.currentUser = CurrentUser(uid: uid , email: email, username: username, bio: bio, location: location)
        }
        
    }
}



    

struct HomepageView: View {
        
    @ObservedObject private var vm = viewUserProfileModel()
    
//    @ObservableObject userID: String


    var body: some View {
        NavigationView{
            VStack{
            
//                Text("CURRENT USER ID: \(vm.currentUser?.uid)")
            
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
    }
}

    

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
            HomepageView()
    }
}


    

