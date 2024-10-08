//
//  NetworkContextFactoryMock.swift
//  RecipeTests
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
@testable import Recipe

class NetworkContextFactoryMock: NetworkContextFactoryProtocol {
    var invokedGetNetworkContext = false
    var invokedGetNetworkContextCount = 0
    var invokedGetNetworkContextParameters: (networkStrategy: NetworkStrategy, Void)?
    var invokedGetNetworkContextParametersList = [(networkStrategy: NetworkStrategy, Void)]()
    var stubbedGetNetworkContextResult: NetworkContextProtocol!
    func getNetworkContext(withStrategy networkStrategy: NetworkStrategy) -> NetworkContextProtocol {
        invokedGetNetworkContext = true
        invokedGetNetworkContextCount += 1
        invokedGetNetworkContextParameters = (networkStrategy, ())
        invokedGetNetworkContextParametersList.append((networkStrategy, ()))
        return stubbedGetNetworkContextResult
    }
}

