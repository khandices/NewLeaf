//
//  NewLeafApp.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/26/22.
//

import SwiftUI
import Firebase
import Foundation


@main
struct NewLeafApp: App {
    @StateObject var viewRouter = ViewRouter()
    
    init() {
         FirebaseApp.configure()
     }
     
     var body: some Scene {
         WindowGroup {
             ContentView().environmentObject(viewRouter)
//             UserProfileView()
//             PlantCardFormView()
         }
     }
 }

