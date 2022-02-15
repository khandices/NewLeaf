//
//  TradePostForm.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/5/22.
//

import Foundation
import SwiftUI


struct TradePostFormView: View {
    @EnvironmentObject var currentUser: ViewUserProfileModel
    
    @ObservedObject var tradeModel = viewTradePostModel()
    @ObservedObject var plantCardModel = viewPlantCardModel()
    
    @State private var selectedPlantForTrade = ""
    @State private var tradepostTitle = ""
    @State private var notFreeTrade: Bool = true
    @State private var tradeUserWants = ""
    
//    let plantList = currentUser.currentUser.plantCards
    
    let plantList = PlantDataLoader().plantData

    @State private var selectedPlant = ""
    @State var selectedPlantInfo = ""

//    func getPlantInfo(plantName: String){
//        for plant in plantList {
//            if plant.name == plantName {
//                self.selectedPlantForTrade = plant
//            }
//        }

//    }
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Form ( content: {
                    TextField("Title", text: $tradepostTitle)
                    //   need to pull from currentUser plantCards
                    Picker(selection: $selectedPlantForTrade,
                           label: Text("Which plant did you want to trade?"),
                           content: {
                        Text("Plant1").tag("Plant1")
                        Text("Plant2").tag("Plant2")
                        Text("Plant3").tag("Plant3")
                    })
                    Section {
                        Text("Is this a free trade?")
                        Picker(selection: $notFreeTrade,
                               label: Text("Is this a free trade?"),
                               content: {
                            Text("Yes").tag(false)
                            Text("No").tag(true)
                        })
                            .pickerStyle(.segmented)
                    }
                    
                    if notFreeTrade {
                        //  need to pull plant names from JSON  file
                        Picker(selection: $tradeUserWants,
                               label: Text("Which plant do you want to trade for?"),
                               content: {
                            Text("Plant1").tag("Plant1")
                            Text("Plant2").tag("Plant2")
                            Text("Plant3").tag("Plant3")
                        })
                    }
                    
                })
                    .navigationTitle("Create Trade")
                
                Button {
//                    tradeModel.addTradePost(title: tradepostTitle, location: currentUser.currentUser.location, plantName: selectedPlantForTrade, username: currentUser.currentUser.username, plantID: String, uid: currentUser.currentUser.id, isFree: notFreeTrade)
                } label: {
                    HStack {
                        Spacer()
                        Text("Create Trade")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                        Spacer()
                    } .background(Color.green)
                        .frame(width: 200)
                        .cornerRadius(10)
                        .offset(y: -200)
                }
            }
        }
        
    }
}



struct TradePostFormView_Previews: PreviewProvider {
    static var previews: some View {
        TradePostFormView()
    }
}

