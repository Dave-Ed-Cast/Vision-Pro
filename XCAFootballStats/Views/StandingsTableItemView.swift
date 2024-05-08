//
//  StandingsTableItemView.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 08/05/24.
//

import SwiftUI
import XCAFootballDataClient

struct StandingsTableItemView: View {
    
    @State var selectedCompletition: Competition?
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompletition) {
                Text($0.name)
            }
            .navigationTitle("XCA ⚽️ standings")
        } detail: {
            if let selectedCompletition {
                StandingsTableView(competition: selectedCompletition)
                    .id(selectedCompletition)
            } else {
                Text("Select a competition!")
            }
        }
    }
}

#Preview {
    StandingsTableItemView()
}
