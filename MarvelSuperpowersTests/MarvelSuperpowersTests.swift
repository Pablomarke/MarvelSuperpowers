//
//  MarvelSuperpowersTests.swift
//  MarvelSuperpowersTests
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import XCTest
@testable import MarvelSuperpowers

final class MarvelSuperpowersTests: XCTestCase {

    let modelsMock = ModelsMocks()
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
       let hero1 = modelsMock.hero
        
        XCTAssertNotNil(hero1)
        XCTAssertEqual(hero1.name, "3-D Man")
        XCTAssertEqual(hero1.id, 1011334)
        XCTAssertEqual(hero1.description, "No description")
        XCTAssertNotNil(hero1.thumbnail)
        XCTAssertNotNil(hero1.series)
        XCTAssertNotNil(hero1.series?.available)
    }

    func testModelSeriesData() throws {
        let serie1 = modelsMock.serie
        
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
        let hero2 = modelsMock.hero
        
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
    
    func testToolViews(){
       let errorV = ErrorView()
        let loadV = LoadView()
        
        XCTAssertNotNil(errorV.body)
        XCTAssertNotNil(errorV)
        XCTAssertNotNil(loadV)
        XCTAssertNotNil(loadV.body)
    }
    
    // MARK: - Celda detail -
    func testDetailRowView() {
        let serie1 = modelsMock.serie
        let row = DetailRowView(model: serie1)
        
        XCTAssertNotNil(row.model)
        XCTAssertEqual(row.model.title, "Los vengadores")
        XCTAssertNotNil(row)
        XCTAssertNotNil(row.body)
    }
}
