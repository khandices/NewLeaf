//
//  ViewUserModel.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/27/22.
//

import Foundation
import Firebase


class viewUserModel: ObservableObject {
    
    @Published var list = [User]()
    
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
                        
                    }
                    // get all documents and create instances of the user struct
                    self.list = snapshot.documents.map { user in
                        // create a user item for each doc returned
                        return User(id: user.documentID,
                                    username: user["username"] as? String ?? "",
                                    email: user["email"] as? String ?? "",
                                    password: user["password"] as? String ?? "",
                                    location: user["location"] as? String ?? "")
                    }
                }
                
            } else {
                //handle the error
            }
            
        }
    }
}


