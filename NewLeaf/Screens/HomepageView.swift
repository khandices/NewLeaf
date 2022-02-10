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
    @Published var currentUser = CurrentUser(id: "test" , email: "test", username: "test", bio: "", location: "")

    init() {
        fetchCurrentUser()
    }
    func fetchCurrentUser() {

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
    @StateObject var currentUser = viewUserProfileModel()
    
    @EnvironmentObject var viewRouter: ViewRouter

    @State private var clickedLogout: Bool = false
//    func signoutUser() {
//        viewRouter.currentPage = .page1
//    }
    
    var body: some View {
        NavigationView{
            VStack{
                // Custom nav bar
//                HStack {
//                    Button("Log out") {
//                        viewRouter.currentPage = .page1
////                        clickedLogout.toggle()
//                        print("user logged out")
//                    }
//                }
//                .padding()
//                .offset(y: -100)
               
                Image("NewLeaf (2)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 180)
                Text("Welcome \(currentUser.currentUser.username)!")
                
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
                
                NavigationLink(destination: UserProfileView().environmentObject(currentUser), label: {
                    Spacer()
                    Text("My Profile")
                        .padding(.vertical, 10)
                        .frame(width: 200)
                        .background(Color.green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    Spacer()
                })
                Button("Log out") {
                    clickedLogout.toggle()
                    print("user logged out")
                }
            }
            .offset(y: -100)
            .actionSheet(isPresented: $clickedLogout) {
                .init(title: Text(""), message: Text("Do you want to log out?"), buttons: [
                    .destructive(Text("Log Out"), action: {
                        print("user logged out")
                        viewRouter.currentPage = .page1
                    }),
                    .cancel()
                    ])
            }
           
        }
        
    }
   
}


    

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
            HomepageView().environmentObject(ViewRouter())
    }
}


    

