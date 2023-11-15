//
//  MarvelSuperpowersTests.swift
//  MarvelSuperpowersTests
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import XCTest
@testable import MarvelSuperpowers

final class MarvelSuperpowersTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - Testing Modelos -
    func testModelHeroeData() throws {
        let thumbnail1 = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg")
        let hero1 = HeroeData(id: 1011334, name: "3-D Man", description: "No description", thumbnail: thumbnail1, series: MarvelItem(available: 2, collectionURI: "", items: [ApiItems(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", name: "Serie 1")], returned: 2))
        
        XCTAssertNotNil(hero1)
        XCTAssertEqual(hero1.name, "3-D Man")
        XCTAssertEqual(hero1.id, 1011334)
        XCTAssertEqual(hero1.description, "No description")
        XCTAssertNotNil(hero1.thumbnail)
        XCTAssertNotNil(hero1.series)
        XCTAssertNotNil(hero1.series?.available)
    }

    func testModelSeriesData() throws {
        let serie1 = SingleSerieData(id: 123, title: "Los vengadores", description: "Qué guay", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"))
        
        XCTAssertNotNil(serie1)
        XCTAssertEqual(serie1.id, 123)
        XCTAssertEqual(serie1.title, "Los vengadores")
        XCTAssertEqual(serie1.description, "Qué guay")
        XCTAssertNotNil(serie1.thumbnail)
        XCTAssertNotNil(serie1.thumbnail?.path)
    }
    
    // MARK: - Testing Views -
    func testMainView() throws {
        let mainView = MainView(viewModel: MainViewModel())
        XCTAssertNotNil(mainView)
        XCTAssertNotNil(MainViewModel())
        XCTAssertNotNil(mainView.body)
        
        let mainViewTest = MainView(viewModel: MainViewModel(testing: true))
        XCTAssertNotNil(mainViewTest)
        XCTAssertNotNil(MainViewModel(testing: true))
        XCTAssertNotNil(mainViewTest.body)
    }
    
    func testDetailView() throws {
        let thumbnail1 = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg")
        let hero2 = HeroeData(id: 1011334, name: "3-D Man", description: "No description", thumbnail: thumbnail1, series: MarvelItem(available: 2, collectionURI: "", items: [ApiItems(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", name: "Serie 1")], returned: 2))
        
        ///Detail view testing: false
        let detailView = DetailView(viewModel: DetailViewModel(hero: hero2))
        
        XCTAssertNotNil(detailView)
        XCTAssertNotNil(DetailViewModel(hero: hero2))
        XCTAssertNotNil(detailView.body)
        
        ///Detail view testing: true
        let detailViewTest = DetailView(viewModel: DetailViewModel(testing: true, hero: hero2 ))
        
        XCTAssertNotNil(detailViewTest)
        XCTAssertNotNil(DetailViewModel(testing: true, hero: hero2))
        XCTAssertNotNil(detailViewTest.body)
    }
    
    func testDetailRowView() {
        let serie1 = SingleSerieData(id: 123, title: "Los vengadores", description: "Qué guay", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"))
        
        let row = DetailRowView(model: serie1)
        XCTAssertNotNil(row.model)
        XCTAssertEqual(row.model.title, "Los vengadores")
        XCTAssertNotNil(row)
        XCTAssertNotNil(row.body)
    }
    
}
