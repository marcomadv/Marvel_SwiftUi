//
//  Model.swift
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
    let result: [Result]?
}

struct Result: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    enum Extension: String, Codable {
        case gif = "gif"
        case jpg = "jpg"
    }
}


