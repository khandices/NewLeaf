//
//  ViewUserModel.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/27/22.
//

import Foundation
import Firebase


class viewUserModel: ObservableObject {
    
    @Published var userList = [User]()
    
    func getData() {
        // get reference to the db //
        let db = Firestore.firestore()
        
        // read documents at a specific path //
        // two parameters are optional: first param will return the documents, second is returned error //
        db.collection("users").getDocuments { snapshot, error in
            // check for errors
            if error == nil {
                //no errors
                
                if let snapshot = snapshot {
                    // update the list property in the main thread
                    DispatchQueue.main.async {
            
                        // get all documents and create instances of the user struct
                        self.userList = snapshot.documents.map { user in
                            // create a user item for each doc returned
                            return User(id: user.documentID,
                                        username: user["username"] as? String ?? "",
                                        email: user["email"] as? String ?? "",
                                        password: user["password"] as? String ?? "",
                                        location: user["location"] as? String ?? "")
                        }
                    }
                }
                
            } else {
                //handle the error
                }
        }
    }
        
    func addData(username: String, email: String, password: String, location: String) {
        //get reference to the db
        let db = Firestore.firestore()
        
        //add doc to user collection
        db.collection("users").addDocument(data: ["username" : username, "email": email, "password": password, "location": location]) { error in
            //check for errors
            if error == nil {
                //no errors
                //call data to retrieve the latest data
                self.getData()
                
            } else {
                //handle the error
            }
        }
    }
    
//    func deleteData(userToDelete: User) {
//        //get reference to db
//        let db = Firestore.firestore()
//
//        //specifiy doc to delete
//        db.collection("users").document(userToDelete.id).delete { error in
//            if error == nil {
//                //no errors
//                //remove document from userList
//                // Update the UI in the main thread
//                DispatchQueue.main.async {
//                self.userList.removeAll{ user in
//                    //check for te user to remove
//                    return user.id == userToDelete.id}
//                }
//
//            }
//        }
//    }
    
    func updateData(userToUpdate: User) {
        //get reference to the db
        let db = Firestore.firestore()
        
        db.collection("users").document(userToUpdate.id).setData(["username": "updated username"], merge: true)
    }
}

