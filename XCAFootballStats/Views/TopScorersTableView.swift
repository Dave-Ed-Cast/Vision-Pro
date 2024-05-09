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
    @Bindable var vm = TopScorersTableObservable()
    var body: some View {
        Table(of: Scorer.self) {
            TableColumn("Scorer") { scorer in
                HStack {
                    Text(scorer.posText)
                        .fontWeight(.bold)
                        .frame(minWidth: 20)
                    
                    AsyncImage(url: URL(string: scorer.team.crest ?? "")) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                        default:
                            Circle()
                                .foregroundStyle(.gray.opacity (0.5))
                        }
                    }
                    .frame(width: 40, height: 40)
                    
                    Text(scorer.player.name)
                }
            }
            .width(min: 264)
            
            TableColumn("Matches") {
                Text($0.playedMatchesText)
                    .frame(minWidth: 60)
            }
            .width(90)
            
            TableColumn("Goals") {
                Text($0.goalsText)
                    .frame(minWidth: 60)
            }
            .width(90)
            
            TableColumn("% Goals") {
                Text($0.goalsPerMatchRatioText)
                    .frame(minWidth: 60)
            }
            .width(90)
            
            TableColumn("Assists") {
                Text($0.assistsText)
                    .frame(minWidth: 60)
            }
            .width(90)
            
            TableColumn("Penalties") {
                Text($0.penaltiesText)
                    .frame(minWidth: 60)
            }
            .width(90)
            
        } rows: {
            ForEach(vm.scorers ?? []) {
                TableRow($0)
            }
        }
        .overlay {
            switch vm.fetchPhase {
                
            case .fetching: ProgressView()
            case .success(let scorers) where scorers.isEmpty:
                Text("Scorer is not available!")
                    .font(.headline)
            case .failure(let error):
                Text(error.localizedDescription)
                    .font(.headline)
            default: EmptyView()
            }
        }
        .foregroundStyle(.primary)
        .navigationTitle(competition.name + " Top Scorers")
        .task(id: vm.selectedFilter.id) {
            await vm.fetchTopScorers(competition: competition)
        }
        .toolbar {
            ToolbarItem(placement: .bottomOrnament) {
                Picker("Filter Options", selection: $vm.selectedFilter) {
                    ForEach(vm.filterOptions, id: \.self) { season in
                        Text(" \(season.text) ")
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        TopScorersTableView(competition: Competition.defaultCompetitions[0])
    }
}
