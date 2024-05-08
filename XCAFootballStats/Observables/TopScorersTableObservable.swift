//
//  TopScorersTableObservable.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 08/05/24.
//

import Foundation
import Observation
import XCAFootballDataClient

@Observable
class TopScorersTableObservable {
    
    //api key
    let client = FootballDataClient(apiKey: footballApiKey)
    
    //this is a structure filled with every data regarding the team score
    var fetchPhase: FetchPhase = FetchPhase<[Scorer]>.initial
    
    //this is the fetchPhase we declared
    var scorers: [Scorer]? { fetchPhase.value }
    
    //this is used for filtering from the library dipendence
    var selectedFilter: FilterOption = .latest
    
    //now the logic for filtering
    var filterOptions: [FilterOption] = {
        var date = Calendar.current.date(byAdding: .year, value: -4, to: Date())!
        var options = [FilterOption]()
        
        for i in 0..<3 {
            if let nextYear = Calendar.current.date(byAdding: .year, value: 1, to: date) {
                options.append(.year(Calendar.current.component(.year, from: nextYear)))
                date = nextYear
            }
        }
        options.append(.latest)
        return options
    }()
    
    func fetchTopScorers(competition: Competition) async {
        
        fetchPhase = .fetching
        do {
            //MARK: For now let's use stubs
//            var scorers = Scorer.stubs
            var scorers = try await client.fetchTopScorers(competitionId: competition.id, filterOption: selectedFilter)
            
            if Task.isCancelled { return }
            
            scorers = scorers.enumerated().map { index, scorer in
                var scorer = scorer
                scorer.pos = index + 1
                return scorer
            }
            fetchPhase = .success(scorers)
        } catch {
            if Task.isCancelled { return }
            fetchPhase = .failure(error)
        }
    }
}

extension Scorer {
    
    static var stubs: [Scorer] {
        let url = Bundle.main.url(forResource: "scorers", withExtension: "json")!
        let scorersResponse: TopScorersResponse = Utility.loadStub(url: url)
        return scorersResponse.scorers!
    }
}
