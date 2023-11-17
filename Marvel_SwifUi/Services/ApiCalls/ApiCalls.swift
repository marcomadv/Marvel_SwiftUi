//
//  ApiCalls.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 11/11/23.
//

import Foundation
import Combine

protocol ApiCallsProtocol {
    func getCharacters(offset: Int) throws -> AnyPublisher<ResponseMarvel, Error>
    func getSeries(characterID: Int) throws -> AnyPublisher<ResponseSeries, Error>
}

class ApiCalls: ApiCallsProtocol {
    private var session: URLSession
    private var baseRequest: BaseRequest
    
    init(session: URLSession = URLSession.shared, baseRequest: BaseRequest = BaseRequest()) {
        self.session = session
        self.baseRequest = baseRequest
    }
    
    func getCharacters(offset: Int) throws -> AnyPublisher<ResponseMarvel, Error> {
        guard let request = baseRequest.request(endpoint: .characters, offset: offset) else {
            throw URLError(.badServerResponse)
        }
        
        return session.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                    return $0.data
             
            }
            .decode(type: ResponseMarvel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getSeries(characterID: Int) throws -> AnyPublisher<ResponseSeries, Error> {
        guard let request = baseRequest.request(endpoint: .series(characterID)) else {
            throw URLError(.badServerResponse)
        }
        return session.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: ResponseSeries.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
