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
    @ObservedObject var plantInfo = viewPlantCardModel()
    @State var plantCardActive: Bool = false
    @State var tradePostActive: Bool = false
    @State var editUserActive: Bool = false
    
    init() {
        plantInfo.getAllPlantCards()
    }
    
    var body: some View {
            VStack {
                NavigationLink(destination: PlantCardFormView().environmentObject(currentUser), isActive: $plantCardActive) {
                    EmptyView()
                }
                NavigationLink(destination: TradePostFormView().environmentObject(currentUser), isActive: $tradePostActive) {
                    EmptyView()
                }
                NavigationLink(destination: EditUserView(nBio: currentUser.currentUser.bio, nLocation: currentUser.currentUser.location, nUsername: currentUser.currentUser.username).environmentObject(currentUser), isActive: $editUserActive) {
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
                VStack {
                        List(plantInfo.plantCardList) { plant in
                            if plant.uid == currentUser.currentUser.id {
                                Text(plant.name)
                                Text(plant.info)
                            }
                        }
                }
                .padding()
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
            }
    }
        
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView().environmentObject(ViewUserProfileModel())
    }
}

