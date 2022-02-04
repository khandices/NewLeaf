//
//  UserProfileView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/27/22.
//

import Foundation
import SwiftUI
import Firebase

struct UserProfileView: View {
    
    @ObservedObject var model = viewUserModel()
    @State private var userEmail = ""
    @State private var userID = ""

    var body: some View {
            
            VStack {
                Text("user image placeholder")
                Text("Username")
                Text("Placeholder for user bio")
                Text("Location")
                HStack {
                    Image("NewLeaf (2)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                            .frame(height: 125)
                    Image("NewLeaf (2)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                            .frame(height: 125)
                    Image("NewLeaf (2)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                            .frame(height: 125)
                }
                
                }
        }
        
        
}
//    init() {
//        model.getAllUsers()

        
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
            UserProfileView()
    }
}

