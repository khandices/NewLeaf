//
//  ContentView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/26/22.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseAuth


 
struct ContentView: View {

    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            LoginView()
        case .page2:
            HomepageView()
                .transition(.scale)
        }
    }
//        NavigationView{
//            LoginView()
//        }
}

    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
            
    }
}


