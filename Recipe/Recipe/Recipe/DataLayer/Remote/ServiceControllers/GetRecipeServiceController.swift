//
//  GetRecipeServiceController.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

protocol GetRecipeServiceControllerProtocol {
    func getRecipeResuest(request: RecipeStruct.Request, completion: @escaping (ServiceOutcome<RecipeStruct.Response>) -> Void)
}

class GetRecipeServiceController: ServiceController, GetRecipeServiceControllerProtocol {

    func getRecipeResuest(request: RecipeStruct.Request, completion: @escaping (ServiceOutcome<RecipeStruct.Response>) -> Void) {
        let requestBuilder = HttpRequestRestBuilder()
        requestBuilder.httpRequest.serviceName = "Get Recipe"
        requestBuilder.httpRequest.serviceType = .external

        requestBuilder.httpRequest.uri = URLConstants.RECIPES_URL
        requestBuilder.httpRequest.method = .get

        let networkStrategy = HttpNetworkStrategy()
        let requestDirector = HttpRequestDirector(HTTPRequestBuilder: requestBuilder)
        let httpRequest = requestDirector.constructHTTPRequest()
        let networkContext = AppEnvironment.current.networkContextFactory.getNetworkContext(withStrategy: networkStrategy)

        networkContext.connect(httpRequest: httpRequest, serviceControllerCallback: { outcome in
            self.decode(RecipeStruct.Response.self, fromOutcome: outcome, completion: completion)
        })
    }
}
