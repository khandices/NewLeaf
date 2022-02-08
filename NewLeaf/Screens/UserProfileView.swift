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
    
    @ObservedObject var model = viewUserModel()
    @State private var userEmail = ""
    @State private var userID = ""

    var body: some View {
            
            VStack {
                VStack{
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
//                        .overlay(RoundedRectangle(cornerRadius: 44).stroke(Color.black, lineWidth: 1)
                    
                    Text("Username")
                        .font(.title)
                        .bold()
                    Text("Location")
                        .bold()
                }
                Text("Placeholder for user bio")
            
                Button {
                } label: {
                    Text("Update Profile")
                }
                HStack {
//                    use READ all request of plant Cards under current userID
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
        }
}



struct optionsMenu {}
        
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
            UserProfileView()
    }
}

