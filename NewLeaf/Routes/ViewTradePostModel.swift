//
//  ViewTradePostModel.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/27/22.
//

import Foundation
import FirebaseAuth
import Firebase

class viewTradePostModel: ObservableObject {
    @Published var tradeID = ""
    @Published var tradePostList = [TradePost]()
    @Published var successMessage = ""
   
    
    func addTradePost(title: String, location: String, plantName: String, username: String, plantID: String, uid: String, isFree: Bool) {
        //get reference to the db
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        //add doc to user collection
         ref = db.collection("trade posts").addDocument(data: ["title": title, "location": location, "plantName": plantName, "username": username, "plantID": plantID, "uid": uid, "isFree": isFree]) { error in
            //check for errors
            if error == nil {
                //no errors
                self.tradeID = ref!.documentID;
                self.addTradeToUser(userID: uid, tradeInfo: self.tradeID, plantInfo: plantID, isFree: isFree)
                self.successMessage = "Trade \(self.tradeID) successfully created! "
                print("*******Successfully added plant card!********")
            } else {
                //handle the error
                self.successMessage = "Trade \(self.tradeID) creation failed"
                print("*******Error creating Plant Card:**********")
            }
        }
        

    }

    func addTradeToUser(userID: String, tradeInfo: String, plantInfo: String, isFree: Bool) {
       let db = Firestore.firestore()

        db.collection("users").document(userID).updateData(["tradePosts": FieldValue.arrayUnion([["id": tradeInfo, "plant": plantInfo, "isFree": isFree]])])
    }
    
 


    func getTradePosts() {
        // get reference to the db //
        let db = Firestore.firestore()

        // read documents at a specific path //
        // two parameters are optional: first param will return the documents, second is returned error //
        db.collection("trade posts").getDocuments { snapshot, error in
            // check for errors
            if error == nil {
                //no errors
                print("inside GeTradePosts function")
                if let snapshot = snapshot {
                    // update the list property in the main thread
                    DispatchQueue.main.async {
                        // get all documents and create instances of the user struct
                        self.tradePostList = snapshot.documents.map { tradePost in
                            // create a user item for each doc returned
                            return TradePost(id: tradePost.documentID,
                                             title: tradePost["title"] as? String ?? "",
                                             location: tradePost["location"] as? String ?? "",
                                             plantName: tradePost["plantName"] as? String ?? "",
                                             username: tradePost["username"] as? String ?? "",
                                             plantID: tradePost["plantID"] as? String ?? "",
                                             uid: tradePost["uid"] as? String ?? "",
                                             isFree: (tradePost["isFree"] != nil) )
                        }
                    }
                }
            } else {
                print("Failed to retrieve tradePosts")
                return
                }
        }
        
    }
}


    

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

