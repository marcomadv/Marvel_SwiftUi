//
//  Series.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 11/11/23.
//

import Foundation

struct ResponseSeries: Codable {
    let data: DataSeries?
}

struct DataSeries: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Serie]?
}

struct Serie: Codable, Identifiable {
    let id: Int?
    let title: String?
    let description: String?
    let startYear, endYear: Int?
    let rating, type: String?
    let thumbnail: Thumbnail?
}


