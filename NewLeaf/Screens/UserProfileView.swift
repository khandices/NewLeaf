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
    
    @EnvironmentObject var vm: viewUserProfileModel

    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
//                        .overlay(RoundedRectangle(cornerRadius: 44).stroke(Color.black, lineWidth: 1)
                    
                    Text("\(vm.currentUser.id)")
                    Text("username")
                        .font(.title)
                        .bold()
                    Text("Location")
                        .bold()
                }
                Text("Placeholder for user bio.")
            
//                Button {
//                } label: {
//                    Text("Update Profile")
//                }
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
            .offset(y: -100)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        NavigationLink (destination: PlantCardFormView(), label: {
                        Text("Register Plant Card")
                        })
                        Text("Create Trade")
                        Text("Log out")
                    }, label: {
                        Image(systemName: "heart.fill")
                    })
//                    Button(action: {
//
//                    }, label : {
//                        Image(systemName: "bell")
//                    })
                }
            }
            }
        }
}
        
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

