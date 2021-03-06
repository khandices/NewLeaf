//
//  PlantCardView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/2/22.
//

import Foundation
import SwiftUI
import Firebase


class PlantDataLoader {
    @Published var plantData = [PlantData]()
    
    
    init() {
        loadData()
        sortData()
    }
    
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "plantInfo", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                let dataFromJson = try decoder.decode([PlantData].self, from: data)
                
                self.plantData = dataFromJson

            } catch {
                print(error)
            }
        }
    }
    
    func sortData() {
        self.plantData = self.plantData.sorted(by: { $0.name < $1.name })
    }
}



struct PlantCardFormView: View {
    @EnvironmentObject var currentUser: ViewUserProfileModel
    @ObservedObject var plantCardModel = viewPlantCardModel()
    
    let plantList = PlantDataLoader().plantData

    @State private var selectedPlant = ""
    @State var selectedPlantInfo = ""

    func getPlantInfo(plantName: String){
        for plant in plantList {
            if plant.name == plantName {
                self.selectedPlantInfo = plant.info
            }
        }

    }
    
    
    var body: some View {
            ScrollView {
                VStack (spacing: 16) {
                    Text("Create a plant card")
                        .font(.title)
                    Picker(selection: $selectedPlant,
                           label: Text("Please choose your plant"),
                           content: {
                                ForEach(plantList, id: \.self) { plant in
                                    Text(plant.name).tag(plant.name)
                                }
                            }
                    )
                        .pickerStyle(WheelPickerStyle())
                        
                    Text("You selected: \(selectedPlant)")
                   
                    
                    Button {
                        getPlantInfo(plantName: selectedPlant)
                        plantCardModel.addPlantCard(name: selectedPlant, info: selectedPlantInfo, uid: currentUser.currentUser.id)

                    } label: {
                        HStack {
                            Spacer()
                            Text("Create Plant Card!")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                
                            Spacer()
                        }
                        .background(Color.green)
                        .cornerRadius(10)
                        .frame(width: 200)
                    }
                    Text(plantCardModel.successMessage)
                        .foregroundColor(.red)
                        
                }
                .padding()
            }

        
    
    }
}

struct PlantCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlantCardFormView()
    }
}

