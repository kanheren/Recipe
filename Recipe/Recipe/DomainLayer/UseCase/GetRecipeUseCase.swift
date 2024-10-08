//
//  GetRecipeUsecase.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

protocol GetRecipeUseCaseProtocol {
    func getRecipeResuest(request: RecipeStruct.Request,
                          completion: @escaping (ServiceOutcome<RecipeStruct.Response>) -> Void)
}

class GetRecipeUseCase: GetRecipeUseCaseProtocol {
    
    func getRecipeResuest(request: RecipeStruct.Request,
                          completion: @escaping (ServiceOutcome<RecipeStruct.Response>) -> Void) {
        
        AppEnvironment.current.getRecipeServiceController.getRecipeResuest(request: request, completion: { response in
            switch response {
            case let .Success(success):
                print("GetRecipeRequest Success")
                completion(.Success(success))
            case .Error(_):
                print("GetRecipeRequest error")
                
                // Send error message back
                var errorMassage = ErrorResponseBaseClass()
                errorMassage.error = "GetRecipeRequest fail error"
                completion(.Error(errorMassage))
            }
        })
    }
}
