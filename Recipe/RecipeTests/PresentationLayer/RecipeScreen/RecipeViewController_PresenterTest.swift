//
//  RecipeViewController_PresenterTest.swift
//  RecipeTests
//
//  Created by Nandkishore on 10/7/24.
//

import XCTest
@testable import Recipe

class AuditTypeViewController_PresenterTest: XCTestCase {
    // MARK: - PROPERTIES
    private var sut:  RecipeViewController_Presenter!
    private var mockView:  RecipeViewControllerMock!
    private var mockNetworkUtility: NetworkUtilityMock!
    
    override func setUp() {
        super.setUp()
        mockView = RecipeViewControllerMock()
        sut = RecipeViewController_Presenter(mockView)
        
        mockNetworkUtility = NetworkUtilityMock()
        mockNetworkUtility.stubbedIsConnectedToNetwork = true
    }
    func test_GetRecipeDataModel() {
        // create an Environment with the mocked service controller
        let testEnvironment = Environment()
        
        // push this test Environment to the current AppEnvironment
        AppEnvironment.push(testEnvironment)
        
        // ACT
        let recipeDataModel = sut.getRecipeDataModel()
        
        // ASSERT
        XCTAssertEqual(recipeDataModel.count, 0, "test_GetRecipeDataModel")
    }
    func test_GetAuditDataModelCount() {
        // create an Environment with the mocked service controller
        let testEnvironment = Environment()
        
        // push this test Environment to the current AppEnvironment
        AppEnvironment.push(testEnvironment)
        
        // ACT
        let recipeDataModelCount = sut.getRecipeDataModelCount()
        
        // ASSERT
        XCTAssertEqual(recipeDataModelCount, 0, "test_GetAuditDataModelCount")
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}

