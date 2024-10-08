//
//  NetworkUtilityMock.swift
//  RecipeTests
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
@testable import Recipe

class NetworkUtilityMock: NetworkUtilityProtocol {
    var invokedIsConnectedToNetworkGetter = false
    var invokedIsConnectedToNetworkGetterCount = 0
    var stubbedIsConnectedToNetwork = false
    var isConnectedToNetwork: Bool {
        invokedIsConnectedToNetworkGetter = true
        invokedIsConnectedToNetworkGetterCount += 1
        return stubbedIsConnectedToNetwork
    }
}
