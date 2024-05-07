//
//  StandingsTableView.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 07/05/24.
//

import SwiftUI
import XCAFootballDataClient

struct StandingsTableView: View {
    
    let competition: Competition
    let vm = StandingsTableObservable()
    var body: some View {
        //teamStandingtable already conforms to Identifiable
        Table(of: TeamStandingTable.self) {
            TableColumn("W") { Text($0.wonText) }
        } rows: {
            ForEach(vm.standings ?? []) {
                TableRow($0)
            }
        }
        .foregroundStyle(.primary)
            .navigationTitle(competition.name)
            .task {
                await vm.fetchStandings(competition: competition)
            }
    }
}

#Preview {
    NavigationStack {
        StandingsTableView(competition: .defaultCompetitions[1])
    }
}
