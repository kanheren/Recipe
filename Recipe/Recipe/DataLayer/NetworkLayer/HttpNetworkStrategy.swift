//
//  HttpNetworkStrategy.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

class HttpNetworkStrategy: NetworkStrategy {
    override func connect(httpRequest: HttpRequest, contextCallback: @escaping (NetworkOutcome) -> Void) {
        self.httpRequest = httpRequest

        let networkManager = NetworkManager()

        networkManager.sendRequest(httpRequest: httpRequest, strategyCallback: { outcome in
            // return response to network context class
            contextCallback(outcome)
        })
    }
}
