//
//  viewPlantModel.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/2/22.
//

import Foundation
import FirebaseAuth
import Firebase

class viewPlantCardModel: ObservableObject {
    @Published var plantID = ""
    @Published var plantCardList = [PlantCard]()
    @Published var successMessage = ""
    
    func addPlantCard(name: String, info: String, uid: String) {
        //get reference to the db
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        //add doc to user collection
         ref = db.collection("plant cards").addDocument(data: ["name": name, "info": info, "uid": uid]) { error in
            //check for errors
            if error == nil {
                //no errors
                self.plantID = ref!.documentID;
                self.addPlantToUser(userID: uid, plant: self.plantID, name: name, info: info)
                self.successMessage = "Plant Card \(self.plantID) successfully created! "
                print("*******Successfully added plant card!********")
            } else {
                //handle the error
                self.successMessage = "Plant Card \(self.plantID) creation failed"
                print("*******Error creating Plant Card:**********")
            }
        }
        

    }
    

    func addPlantToUser(userID: String, plant: String, name: String, info: String) {
       let db = Firestore.firestore()

        db.collection("users").document(userID).updateData(["plantCards": FieldValue.arrayUnion([["id": plant, "name": name, "info": info]])])
    }
    


    func getAllPlantCards() {
        // get reference to the db //
        let db = Firestore.firestore()

        // read documents at a specific path //
        // two parameters are optional: first param will return the documents, second is returned error //
        db.collection("plant cards").getDocuments { snapshot, error in
            // check for errors
            if error == nil {
                //no errors

                if let snapshot = snapshot {
                    // update the list property in the main thread
                    DispatchQueue.main.async {
                        // get all documents and create instances of the user struct
                        self.plantCardList = snapshot.documents.map { plantCard in
                            // create a user item for each doc returned
                            return PlantCard(id: plantCard.documentID,
                                             name: plantCard["name"] as? String ?? "",
                                             info: plantCard["info"] as? String ?? "",
                                             uid: plantCard["uid"] as? String ?? "")
                        }
                    }
                }
            } else {
                print("Failed to retrieve plantCards")
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

//

