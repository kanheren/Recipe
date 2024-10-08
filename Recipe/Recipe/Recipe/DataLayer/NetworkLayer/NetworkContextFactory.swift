//
//  NetworkContextFactory.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

import Foundation

protocol NetworkContextFactoryProtocol {
    func getNetworkContext(withStrategy networkStrategy: NetworkStrategy) -> NetworkContextProtocol
}

class NetworkContextFactory: NetworkContextFactoryProtocol {
    func getNetworkContext(withStrategy networkStrategy: NetworkStrategy) -> NetworkContextProtocol {
        FXSNetworkContext(withStrategy: networkStrategy)
    }
}
