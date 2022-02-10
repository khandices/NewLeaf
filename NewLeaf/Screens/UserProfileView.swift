//
//  UserProfileView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/27/22.
//
//let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)


import Foundation
import SwiftUI
import Firebase




struct UserProfileView: View {
    
    @EnvironmentObject var currentUser: viewUserProfileModel

    var body: some View {
        VStack {
            // Custom nav bar
            HStack{
                Spacer()
                Button {
                    print("user logged out")
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
            .padding()
            .offset(y: -70)
            VStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                
                //                    Text("\(vm.currentUser.id)")
                Text(currentUser.currentUser.username)
                    .font(.title)
                    .bold()
                Text(currentUser.currentUser.location)
                    .bold()
            }
            Text(currentUser.currentUser.bio)
            
            //                Button {
            //                } label: {
            //                    Text("Update Profile")
            //                }
            HStack {
                // use READ all request of plant Cards under current userID
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
            .padding()
        }
        .padding()
        .offset(y: -100)
    }
}


        
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView().environmentObject(viewUserProfileModel())
    }
}

