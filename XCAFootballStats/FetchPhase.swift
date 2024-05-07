//
//  FetchPhase.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 07/05/24.
//

import Foundation

enum FetchPhase<outcome> {
    
    case initial
    case fetching
    case success(outcome)
    case failure(Error)
    
    //just define values of outcome and error according to a simple logic
    var value: outcome? {
        
        if case .success(let outcome) = self {
            return outcome
        }
        return nil
    }
    
    var error: Error? {
        if case .failure(let error) = self {
            return error
        }
        return nil
    }
}
