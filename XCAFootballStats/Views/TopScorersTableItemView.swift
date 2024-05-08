//
//  TopScorersTableItemView.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 08/05/24.
//

import SwiftUI
import XCAFootballDataClient

struct TopScorersTableItemView: View {
    
    @State var selectedCompletition: Competition?
    var body: some View {
        NavigationSplitView {
            List(Competition.defaultCompetitions, id: \.self, selection: $selectedCompletition) {
                Text($0.name)
            }
            .navigationTitle("XCA ⚽️ scorers")
        } detail: {
            if let selectedCompletition {
                TopScorersTableView(competition: selectedCompletition)
                    .id(selectedCompletition)
            } else {
                Text("Select a competition!")
            }
        }
    }
}

#Preview {
    TopScorersTableItemView()
}
