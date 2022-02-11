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
    
    @EnvironmentObject var currentUser: ViewUserProfileModel
    @State var plantCardActive: Bool = false
    @State var tradePostActive: Bool = false
    @State var editUserActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: PlantCardFormView(), isActive: $plantCardActive) {
                    EmptyView()
                }
                NavigationLink(destination: TradePostFormView(), isActive: $tradePostActive) {
                    EmptyView()
                }
                NavigationLink(destination: EditUserView(), isActive: $editUserActive) {
                    EmptyView()
                }
                VStack{
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    
                    Text(currentUser.currentUser.username)
                        .font(.title)
                        .bold()
                    Text(currentUser.currentUser.location)
                        .bold()
                }
                Text(currentUser.currentUser.bio)
                
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
            .offset(y: -100)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Button("Register plant card") {
                            plantCardActive.toggle()
                        }
                        Button("Create Trade") {
                            tradePostActive.toggle()
                        }
                        Button("Edit Profile") {
                            editUserActive.toggle()
                        }
                    } label: {
                        Label("Options", systemImage: "ellipsis")
                    }
                }
            }
            .padding()
                
        }
    }
        
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView().environmentObject(ViewUserProfileModel())
    }
}



//                HStack {
//                    Spacer()
//                    NavigationLink(destination: PlantCardFormView(), isActive: $plantCardActive) {
//                        EmptyView()
//                    }
//                    NavigationLink(destination: TradePostFormView(), isActive: $tradePostActive) {
//                        EmptyView()
//                    }
//                    NavigationLink(destination: EditUserView(), isActive: $editUserActive) {
//                        EmptyView()
//                    }
//                    Menu {
//                        Button("Register plant card") {
//                            plantCardActive.toggle()
//                        }
//                        Button("Create Trade") {
//                            tradePostActive.toggle()
//                        }
//                        Button("Edit Profile") {
//                            editUserActive.toggle()
//                        }
//                    } label: {
//                        Label("Options", systemImage: "ellipsis")
//                    }
//                }
//                .padding()
//                .offset(y: -100)
