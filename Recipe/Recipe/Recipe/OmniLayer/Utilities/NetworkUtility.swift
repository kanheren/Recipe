//
//  NetworkUtility.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

protocol NetworkUtilityProtocol {
    var isConnectedToNetwork: Bool { get }
}

class NetworkUtility: NetworkUtilityProtocol {
    var isConnectedToNetwork: Bool {
        //UtilityNetworkClass.isConnectedToNetwork()
        return true
    }
}
