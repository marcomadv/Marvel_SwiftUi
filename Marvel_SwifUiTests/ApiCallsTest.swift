//
//  ApiCallsTest.swift
//  Marvel_SwifUiTests
//
//  Created by Marco Muñoz on 17/11/23.
//

import Foundation
import XCTest
import Combine

@testable import Marvel_SwifUi

final class ApiCallsTest: XCTestCase {
    private var sut: ApiCalls!
    private var suscriptor = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        sut = ApiCalls(session: session)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testCharacters() throws {
        MockURLProtocol.requestHandler = { request in
            let data = MockData().characterData()
            let response = try XCTUnwrap(self.urlResponseTest(success: true))
            return (response, data!)
        }
        
        let expectation = expectation(description: "Characters loaded")
        try sut.getCharacters(offset: 0)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Waiting for success\(error.localizedDescription)")
                }
            } receiveValue: { response in
                XCTAssertNotNil(response)
                XCTAssertEqual(response.data?.count, 20)
                let character = response.data?.results?.first
                XCTAssertNotNil(character)
                XCTAssertEqual(character?.id, 1011334)
                XCTAssertEqual(character?.name, "3-D Man")
            }
            .store(in: &suscriptor)
            wait(for: [expectation], timeout: 1)
    }
    
    func testCharactersError() throws {
        MockURLProtocol.requestHandler = { request in
            let data = MockData().characterData()
            let response = try XCTUnwrap(self.urlResponseTest(success: false))
            return (response, data!)
        }
        
        let expectation = expectation(description: "Characters loading fail")
        try sut.getCharacters(offset: 0)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    XCTFail("Waiting for failure")
                case .failure(_):
                    expectation.fulfill()
                }
            } receiveValue: { response in
                XCTAssertNil(response)
            }
            .store(in: &suscriptor)
            wait(for: [expectation], timeout: 1)
    }
    
    func testSeries() throws {
        MockURLProtocol.requestHandler = { request in
            let data = MockData().seriesData()
            let response = try XCTUnwrap(self.urlResponseTest(success: true))
            return (response, data!)
        }
        
        let expectation = expectation(description: "Series Loaded")
        try sut.getSeries(characterID: 1011334)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure(_):
                    XCTFail("Waiting for success")
                }
            } receiveValue: { response in
                XCTAssertNotNil(response)
                XCTAssertEqual(response.data?.count, 2)
                let serie = response.data?.results?.first
                XCTAssertNotNil(serie)
                XCTAssertEqual(serie?.id, 17765)
                XCTAssertEqual(serie?.title, "FREE COMIC BOOK DAY 2013 1 (2013)")
            }
        
            .store(in: &suscriptor)
        wait(for: [expectation], timeout: 1)
    }
    
    func testSeriesError() throws {
        MockURLProtocol.requestHandler = { request in
            let data = MockData().seriesData()
            let response = try XCTUnwrap(self.urlResponseTest(success: false))
            return (response, data!)
        }
        
        let expectation = expectation(description: "Series loading fail")
        try sut.getSeries(characterID: 1011334)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    XCTFail("Waiting for error")
                case .failure(_):
                    expectation.fulfill()
                }
            } receiveValue: { response in
                XCTAssertNil(response)
            }
        
            .store(in: &suscriptor)
        wait(for: [expectation], timeout: 1)
    }
    
    private func urlResponseTest(success: Bool) -> HTTPURLResponse? {
        HTTPURLResponse(
            url: (BaseRequest().request(endpoint: .characters)?.url)!,
            statusCode: success ? 200 : 404,
            httpVersion: nil,
            headerFields: ["Content-Type": "application/json"]
        )
    }
}
