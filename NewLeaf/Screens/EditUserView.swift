//
//  EditUserView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/10/22.
//

import Foundation
import SwiftUI

struct EditUserView: View {
    @EnvironmentObject var currentUser: ViewUserProfileModel
    
    @State private var selectedPlantForTrade = ""
    @State private var tradepostTitle = ""
    @State private var notFreeTrade: Bool = true
    @State private var tradeUserWants = ""
    
    var body: some View {
        NavigationView{
                VStack{
                    Text("Edit user menu")
                }
        }
    }
}
