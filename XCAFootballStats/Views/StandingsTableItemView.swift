//
//  StandingsTableItemView.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 08/05/24.
//

import SwiftUI
import XCAFootballDataClient

struct StandingsTableItemView: View {
    
    @State var selectedCompetition: Competition?
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompetition) {
                Text($0.name)
            }
            .navigationTitle("XCA ⚽️ standings")
        } detail: {
            if let selectedCompetition {
                StandingsTableView(competition: selectedCompetition)
                    .id(selectedCompetition)
            } else {
                Text("Select a competition!")
            }
        }
    }
}

#Preview {
    StandingsTableItemView()
}
