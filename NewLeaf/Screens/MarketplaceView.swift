//
//  TradePostTimelineView.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 1/27/22.
//

import Foundation
import SwiftUI


struct MarketplaceView: View {
    
    @EnvironmentObject var currentUser: ViewUserProfileModel
    @ObservedObject var trades = viewTradePostModel()

    init() {
        trades.getTradePosts()
        print(trades.tradePostList)
    }
    
    var body: some View {
            VStack {
                Text("Welcome to the Trading Post!")
                    .font(.title)
                List(trades.tradePostList) { trade in
                    Section {
                        Text(trade.title)
                            .bold()
                        HStack {
                            Text(trade.plantName)
                            Text(trade.username)
                        }
                    }
                }
            }
    }
}
    

struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView().environmentObject(ViewUserProfileModel())
    }
}
