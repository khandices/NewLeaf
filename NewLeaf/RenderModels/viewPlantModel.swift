//
//  viewPlantModel.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/2/22.
//

import Foundation


//@Published var userList = [User]()
//
//func getAllPlants() {
//    // get reference to the db //
//    let db = Firestore.firestore()
//
//    // read documents at a specific path //
//    // two parameters are optional: first param will return the documents, second is returned error //
//    db.collection("users").getDocuments { snapshot, error in
//        // check for errors
//        if error == nil {
//            //no errors
//
//            if let snapshot = snapshot {
//                // update the list property in the main thread
//                DispatchQueue.main.async {
//
//                    // get all documents and create instances of the user struct
//                    self.userList = snapshot.documents.map { user in
//                        // create a user item for each doc returned
//                        return User(id: user.documentID,
//                                    username: user["username"] as? String ?? "",
//                                    email: user["email"] as? String ?? "",
//                                    location: user["location"] as? String ?? "")
//                    }
//                }
//            }
//
//        } else {
//            //handle the error
//            }
//    }
//}
//
//
//    func fetchcurrentPlant() {
//        guard let uid = ""
//                FirebaseManager.shared.auth
//                .currentUser?.uid else { return }


//        // get reference to the db //
//        let db = Firestore.firestore()
//        let currentUser = db.collection("users").document(userToGet.id)
//        // read documents at a specific path //
//        // two parameters are optional: first param will return the documents, second is returned error //
//        currentUser.getDocument { snapshot, error in
//            // check for errors
//            if error == nil {
//                //no errors
//
//                if let snapshot = snapshot {
//                    // update the list property in the main thread
//                    let username = snapshot.get("username")
//                    let userEmail = snapshot.get("email")
//                    let userLocation = snapshot.get("location")
//                    return User(id: currentUser.documentID, username: username as? String ?? "", email: userEmail as? String ?? "", location: userLocation as? String ?? "")
//                }
//            } else {
//                //handle the error
//                }
//        }
//
//
//func addPlant(plantName: String) {
//    //get reference to the db
//    let db = Firestore.firestore()
//
//    //add doc to user collection
//    db.collection("plantcard").addDocument(data: ["name": plantName]) { error in
//        //check for errors
//        if error == nil {
//            //no errors
//            //call data to retrieve the latest data
//            self.getAllUsers()
//
//        } else {
//            //handle the error
//        }
//    }
//}
//
//
//func deleteUser(userToDelete: User) {
//    //get reference to db
//    let db = Firestore.firestore()
//
//    //specifiy doc to delete
//    db.collection("users").document(userToDelete.id).delete { error in
//        if error == nil {
//            //no errors
//            //remove document from userList
//            // Update the UI in the main thread
//            DispatchQueue.main.async {
//            self.userList.removeAll{ user in
//                //check for te user to remove
//                return user.id == userToDelete.id}
//            }
//
//        }
//    }
//}
//
//
//func updateUser(userToUpdate: User) {
//    //get reference to the db
//    let db = Firestore.firestore()
//
//    db.collection("users").document(userToUpdate.id).setData(["username": "updated username"], merge: true)
//}
//}
//
