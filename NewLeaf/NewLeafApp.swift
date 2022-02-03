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
    
    init() {
         FirebaseApp.configure()
     }
     
     var body: some Scene {
         WindowGroup {
             ContentView()
             UserProfileView()
             PlantCardFormView()
         }
     }
 }

