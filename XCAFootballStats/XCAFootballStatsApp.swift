//
//  XCAFootballStatsApp.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 07/05/24.
//

import SwiftUI

let footballApiKey = "134ddec149b34b599513b78db2490625"

@main
struct XCAFootballStatsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                StandingsTableItemView()
                    .tabItem { Label("Standings", systemImage: "table.fill") }
                
                Text("Top scorers")
                    .tabItem { Label("Top Scorers", systemImage: "soccerball.inverse") }
            }
        }
    }
}
