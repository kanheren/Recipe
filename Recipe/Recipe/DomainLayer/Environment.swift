//
//  Environment.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

struct Environment {
    
    // Use Case
    let getRecipeUseCase: GetRecipeUseCaseProtocol
    
    // Service Controller
    let getRecipeServiceController: GetRecipeServiceControllerProtocol
    
    // Helper, Singleton and Factory
    let networkUtility: NetworkUtilityProtocol
    let networkContextFactory: NetworkContextFactoryProtocol
    
    
    init(
        // Use cases
        getRecipeUseCase: GetRecipeUseCaseProtocol = GetRecipeUseCase(),
    
        // Service Controllers
        getRecipeServiceController: GetRecipeServiceControllerProtocol = GetRecipeServiceController(),
        
        // Keep this last
        networkUtility: NetworkUtilityProtocol = NetworkUtility(),
        networkContextFactory: NetworkContextFactoryProtocol = NetworkContextFactory()
    ) {
        // Use cases
        self.getRecipeUseCase = getRecipeUseCase
        
        // Service Controllers
        self.getRecipeServiceController = getRecipeServiceController
        
        // Keep this last
        self.networkUtility = networkUtility
        self.networkContextFactory = networkContextFactory
    }
}
