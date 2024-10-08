//
//  GetRecipeServiceControllerMock.swift
//  RecipeTests
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
@testable import Recipe

class GetRecipeServiceControllerMock: GetRecipeServiceControllerProtocol {

    private let getRecipeResponse: RecipeStruct.Response?
   
    init(getRecipeResponse: RecipeStruct.Response? = nil) {
        self.getRecipeResponse = getRecipeResponse
    }

    func getRecipeResuest(request: Recipe.RecipeStruct.Request,
                          completion: @escaping (Recipe.ServiceOutcome<Recipe.RecipeStruct.Response>) -> Void) {
        if let response = self.getRecipeResponse {
            completion(.Success(response))
            return
        }
    }
}
