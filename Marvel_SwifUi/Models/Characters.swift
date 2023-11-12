//
//  Characters.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 11/11/23.
//

import Foundation

struct ResponseMarvel: Codable {
    let data: DataClass?
}

struct DataClass: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Character]?
}

struct Character: Codable, Identifiable{
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
}



