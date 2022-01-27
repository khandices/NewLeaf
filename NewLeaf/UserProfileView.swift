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

    var body: some View {
        List(model.userList) { user in
            Text(user.username)
        }
    }
    init() {
        model.getData()
    }
        
        
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserProfileView()
        }
    }
}
}
