//
//  TopScorersTableView.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 08/05/24.
//

import SwiftUI
import XCAFootballDataClient

struct TopScorersTableView: View {
    
    let competition: Competition
    var body: some View {
        Text("")
    }
}

#Preview {
    NavigationStack {
        TopScorersTableView(competition: Competition.defaultCompetitions[0])
    }
}
