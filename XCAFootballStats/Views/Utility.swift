//
//  Utility.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 07/05/24.
//

import Foundation

struct Utility {
    
    //this is the decoder for json files because we have stubs
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    //this formats the date
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    //this is the function that loads the json files with the decoder. "D" stands for decodable
    static func loadStub<D: Decodable>(url: URL) -> D {
        
        //it might failt therefore
        let data = try! Data(contentsOf: url)
        do {
            let d = try jsonDecoder.decode(D.self, from: data)
            return d
        } catch {
            print(error)
            fatalError()
        }
    }
    
    //another formatter
    static let dateYearFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "YYYY"
        return df
    }()
    
}
