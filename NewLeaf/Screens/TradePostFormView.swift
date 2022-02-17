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
    @ObservedObject var plantInfo = viewPlantCardModel()
    
    @State private var selectedPlantForTrade = ""
    @State private var tradepostTitle = ""
    @State private var notFreeTrade: Bool = true
    @State private var tradeUserWants = ""
    @State var selectedPlantID = ""
    
    init() {
        plantInfo.getAllPlantCards()
    }
    
    func getPlantInfo(plantName: String){
        for plant in plantInfo.plantCardList {
            if plant.name == plantName {
                self.selectedPlantID = plant.id
            }
        }

    }

    @State private var selectedPlant = ""
    @State var selectedPlantInfo = ""
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    var body: some View {
        ScrollView {
            VStack {
                Section {
                    TextField("Title", text: $tradepostTitle)
                }
                .padding(12)
                .background(lightGreyColor)
                Section {
                    Text("Which plant did you want to trade?")
                    Picker(selection: $selectedPlantForTrade,
                           label: Text("Which plant did you want to trade?"),
                           content: {
                        ForEach(plantInfo.plantCardList) { plant in
                            if plant.uid == currentUser.currentUser.id {
                            Text(plant.name).tag(plant.name)
                            }
                        }
                    }).pickerStyle(WheelPickerStyle())
                    Text("You selected: \(selectedPlantForTrade)")
                }
                Section {
                    Text("Is this a free trade?")
                    Picker(selection: $notFreeTrade,
                           label: Text("Is this a free trade?"),
                           content: {
                        Text("Yes").tag(false)
                        Text("No").tag(true)
                    }).pickerStyle(SegmentedPickerStyle())
                }
                    
//                    if notFreeTrade {
//                        //  need to pull plant names from JSON  file
//                        Picker(selection: $tradeUserWants,
//                               label: Text("Which plant do you want to trade for?"),
//                               content: {
//                            Text("Plant1").tag("Plant1")
//                            Text("Plant2").tag("Plant2")
//                            Text("Plant3").tag("Plant3")
//                        })
//                    }
                Button {
                    getPlantInfo(plantName: selectedPlantForTrade)
                    tradeModel.addTradePost(title: tradepostTitle, location: currentUser.currentUser.location, plantName: selectedPlantForTrade, username: currentUser.currentUser.username, plantID: selectedPlantID, uid: currentUser.currentUser.id, isFree: notFreeTrade)
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
                }
                    
                Text(tradeModel.successMessage)
                        .foregroundColor(.red)
                }
            }
            .padding()
            .navigationTitle("Create Trade")
        }
    }




struct TradePostFormView_Previews: PreviewProvider {
    static var previews: some View {
        TradePostFormView()
    }
}

