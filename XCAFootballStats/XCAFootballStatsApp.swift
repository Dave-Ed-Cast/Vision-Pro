//
//  XCAFootballStatsApp.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 07/05/24.
//

import SwiftUI

//this is the api key for request
let footballApiKey = "134ddec149b34b599513b78db2490625"

@main
struct XCAFootballStatsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                //these are the views we use in the visionOS and their labels
                StandingsTableItemView()
                    .tabItem { Label("Standings", systemImage: "table.fill") }
                
                TopScorersTableItemView()
                    .tabItem { Label("Top Scorers", systemImage: "soccerball.inverse") }
            }
        }
    }
}
