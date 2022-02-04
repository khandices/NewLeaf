//
//  PlantCardView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/2/22.
//

import Foundation
import SwiftUI
import Firebase


public class PlantDataLoader {
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

    let plantList = PlantDataLoader().plantData
    

    @State private var selectedPlant = "Alocosia Frydek"
    
    @ObservedObject var model = viewPlantCardModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 16) {
                    Image("NewLeaf (2)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                    
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
            
                    } label: {
                        HStack {
                            Spacer()
                            Text("Create Plant Card!")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                            Spacer()
                        } .background(Color.green)
                    }
                    
                        
                }
                .padding()
                .background(Color(.init(white: 0, alpha: 0.05)))
                        .ignoresSafeArea()
            }
            .navigationTitle("Create your Plant card")
            .background(Color(.init(white:0, alpha: 0.05))
                            .ignoresSafeArea())
        }
    
    }
    
    

//
//    private func createPlantCard() {
//      model.addPlantCard(userID: String, plantCard: PlantCard)
        
//        }
//
//    }
//
//    private func loginUser() {
//        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
//            if let error = error {
//                print("Failed to login user:" , error)
//                self.loginStatusMessage = "Failed to login user: \(error)"
//                return
//            }
//            self.loginStatusMessage = "\(userEmail) successfully logged in!"
//        }
//    }
//



struct PlantCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlantCardFormView()
    }
}
}
