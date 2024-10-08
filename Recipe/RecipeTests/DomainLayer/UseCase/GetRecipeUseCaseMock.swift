//
//  GetRecipeUseCaseMock.swift
//  RecipeTests
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
@testable import Recipe

class GetRecipeUseCaseMock: GetRecipeUseCaseProtocol {
    var invokedGetRecipe = false
    var invokedGetRecipeCount = 0
    var invokedGetRecipeParameters: (request: Recipe.RecipeStruct.Request, Void)?
    var stubbedGetRecipeCompletionHandlerResult: (ServiceOutcome<Recipe.RecipeStruct.Response>)?
    
    func getRecipeResuest(request: Recipe.RecipeStruct.Request,
                          completion: @escaping (Recipe.ServiceOutcome<Recipe.RecipeStruct.Response>) -> Void) {
        invokedGetRecipe = true
        invokedGetRecipeCount = 1
        invokedGetRecipeParameters = (request, ())
        if let result = stubbedGetRecipeCompletionHandlerResult {
            completion(result)
        }
    }
}
