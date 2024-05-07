//
//  StandingsTableObservables.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 07/05/24.
//

import Foundation
import Observation
import XCAFootballDataClient

//this is observable so the view changes according to changes here
@Observable
class StandingsTableObservable {
    
    //api key
    let client = FootballDataClient(apiKey: footballApiKey)
    
    //this is a structure filled with every data regarding the team score
    var fetchPhase: FetchPhase = FetchPhase<[TeamStandingTable]>.initial
    
    //this is the fetchPhase we declared
    var standings: [TeamStandingTable]? { fetchPhase.value }
    
    //now we need to actually fetch data. It must be async due to api response
    func fetchStandings(competition: Competition) async {
        
        //MARK: For now comment this to work with stubs
//        //initialize fetching state
//        fetchPhase = .fetching
//        
//        //this block is guarding the fetching result
//        do {
//            //async call the api regarding the competition and set success if everything ok
//            let standings = try await client.fetchStandings(competitionId: competition.id)
//            
//            //howver given that we are handling the phases, we must handle concurrency aswell, therefore
//            if Task.isCancelled { return }
//            fetchPhase = .success(standings)
//            
//        } catch {
//            
//            //same here
//            if Task.isCancelled { return }
//            
//            //else fail
//            fetchPhase = .failure(error)
//        }
        
        fetchPhase = .success (TeamStandingTable.stubs)
    }
}


extension TeamStandingTable {
    
    static var stubs: [TeamStandingTable] {
        
        //get the file from its folder location
        let url = Bundle.main.url(forResource: "standings", withExtension: "json")
        
        let standingResponse: StandingResponse = Utility.loadStub(url: url!)
        return standingResponse.standings!.first { $0.type == "TOTAL" }!.table
    }
}
