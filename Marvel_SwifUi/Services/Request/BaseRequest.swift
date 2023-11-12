//
//  Request.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 11/11/23.
//

import Foundation

let server = "gateway.marvel.com"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
}

enum EndPoints {
    case characters
    case series (_ characterId: Int)
    
    var content: String {
        return "/v1/public"
    }
    
    func path() -> String {
        switch self {
        case .characters:
            return "\(content)/characters"
        case .series (let id):
            return "\(content)/characters/\(id)/series"
        }
    }
}

struct BaseRequest {
    private func queryItems(offset: Int) -> [URLQueryItem]  {
        let ts = "\(Date().timeIntervalSince1970)"
        let hash = "\(ts)\(Constants.marvelPrivateApiKey)\(Constants.marvelPublicApiKey)".MD5
        
        let urlQueryItems: [URLQueryItem] = [
            URLQueryItem.init(name: "ts", value: ts),
            URLQueryItem.init(name: "apikey", value: Constants.marvelPublicApiKey),
            URLQueryItem.init(name: "hash", value: hash),
            URLQueryItem.init(name: "limit", value: "20"),
            URLQueryItem.init(name: "offset", value: "\(offset)")
            
        ]
        
        return urlQueryItems
    }
    
    func request(endpoint: EndPoints, offset: Int = 0) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = server
        components.port = 443
        components.path = endpoint.path()
        components.queryItems = queryItems(offset: offset)
        if let url = components.url {
            let request = URLRequest(url: url)
            return request
        } else {
            return nil
        }
    }
}
