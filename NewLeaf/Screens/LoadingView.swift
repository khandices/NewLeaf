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


struct LoadingView: View {

    var userEmail: String
    var userID: String
    @ObservedObject var model = viewUserModel()
    
    
    
    var body: some View {
        Text("Loading Image")
    }
    
//    func createUser() {
//        model.addUser(id: userID, email: userEmail)

}
    
    

