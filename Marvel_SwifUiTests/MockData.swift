//
//  MockCharacterTest.swift
//  Marvel_SwifUiTests
//
//  Created by Marco Muñoz on 17/11/23.
//

import Foundation
@testable import Marvel_SwifUi

class MockData {
    
    func characterData() -> Data? {
        let path = Bundle(for: type(of: self)).path(forResource: "MockCharacter", ofType: "json")
        let url = URL.init(filePath: path!)
        return try? Data.init(contentsOf: url)
    }
    
    func characterResponse() -> ResponseMarvel? {
        if let data = characterData() {
            return try? JSONDecoder().decode(ResponseMarvel.self, from: data)
        }
        return nil
    }
    
    func seriesData() -> Data? {
        let path = Bundle(for: type(of: self)).path(forResource: "MockSeries", ofType: "json")
        let url  = URL.init(filePath: path!)
        return try? Data.init(contentsOf: url)
    }
    
    func serieResponse() -> ResponseSeries? {
        if let data = seriesData() {
            return try? JSONDecoder().decode(ResponseSeries.self, from: data)
        }
        return nil
    }
}
