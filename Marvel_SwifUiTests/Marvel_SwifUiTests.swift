//
//  Marvel_SwifUiTests.swift
//  Marvel_SwifUiTests
//
//  Created by Marco Muñoz on 11/11/23.
//

import XCTest
import SwiftUI
import Combine
import ViewInspector

@testable import Marvel_SwifUi

final class Marvel_SwifUiTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testModels() throws {
        let modelCharacter: Character = MockDataCharacter().characterOne
        XCTAssertNotNil(modelCharacter)
        XCTAssertEqual(modelCharacter.name, "A-Bomb (HAS)")
        XCTAssertEqual(modelCharacter.id, 1017100)
        XCTAssertEqual(modelCharacter.description, "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ")
        
        let modelThumnail: Thumbnail? = MockDataCharacter().characterOne.thumbnail
        XCTAssertNotNil(modelThumnail)
        XCTAssertEqual(modelThumnail?.path, "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16")
        XCTAssertEqual(modelThumnail?.thumbnailExtension, "jpg")
        
        let modelSeries: Serie = MockDataSeries().serieOne
        XCTAssertNotNil(modelSeries)
        XCTAssertEqual(modelSeries.id, 17765)
        XCTAssertEqual(modelSeries.title, "FREE COMIC BOOK DAY 2013 1 (2013)")
        XCTAssertEqual(modelSeries.description, nil)
        XCTAssertEqual(modelSeries.startYear, 2013)
        XCTAssertEqual(modelSeries.rating, "")
        
        let compoundUrl = Thumbnail(path: MockDataCharacter().characterOne.thumbnail?.path, thumbnailExtension: MockDataCharacter().characterOne.thumbnail?.thumbnailExtension).urlPhoto
        XCTAssertEqual(compoundUrl, URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg"))
    }
    
    func testUIViews() throws {
        let view = PrincipalRowView(character: MockDataCharacter().characterOne)
        XCTAssertNotNil(view)
        
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let items = try view.inspect().count
        XCTAssertEqual(items, 1)
        
        let progressView = ProgressViewPersonalized()
        XCTAssertNotNil(progressView)
        
        let totalItem = try progressView.inspect().count
        XCTAssertEqual(totalItem, 1)
        
        let launchScreen = LaunchScreen()
        XCTAssertNotNil(launchScreen)
        
        let totalItemlaunchScreenView = try launchScreen.inspect().count
        XCTAssertEqual(totalItemlaunchScreenView, 1)
        
        let imgOne = try launchScreen.inspect().find(viewWithId: 0)
        XCTAssertNotNil(imgOne)
        
        let imgTwo = try launchScreen.inspect().find(viewWithId: 1)
        XCTAssertNotNil(imgTwo)
        
        let detailRowView = DetailRowView(serie: MockDataSeries().serieOne)
        XCTAssertNotNil(detailRowView)
        
        let imgDetail = try detailRowView.inspect().find(viewWithId: 0)
        XCTAssertNotNil(imgDetail)
        
        let textSerie = try detailRowView.inspect().find(viewWithId: 1)
        XCTAssertNotNil(textSerie)
        
        let countItems = try detailRowView.inspect().count
        XCTAssertEqual(countItems, 1)
        
        let detailView = DetailView(viewModel: DetailViewModel(characterID: MockDataCharacter().characterOne.id!))
        XCTAssertNotNil(detailView)
        
        let item1 = try detailView.inspect().find(viewWithId: 0)
        XCTAssertNotNil(item1)
    }
    
    func testViewModelCharacter() throws {
        let expectation = self.expectation(description: "Load Characters")
        var suscriptor = Set<AnyCancellable>()
        let vm = PrincipalViewModel()
        XCTAssertNotNil(vm)
        vm.characters.publisher
            .sink { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1, 1)
            }
            .store(in: &suscriptor)
        
        vm.loadCharacterTesting()
        self.waitForExpectations(timeout: 10)
    }
    
    func testViewModelSeries() throws {
        let expectation = self.expectation(description: "Load Series")
        var suscriptor = Set<AnyCancellable>()
        let vm = DetailViewModel(characterID: 1009144)
        XCTAssertNotNil(vm)
        vm.series.publisher
            .sink { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1, 1)
            }
            .store(in: &suscriptor)
        
        vm.loadSeriesTesting()
        self.waitForExpectations(timeout: 10)
        
    }
}
