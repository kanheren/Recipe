//
//  NetworkContextMock.swift
//  RecipeTests
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
@testable import Recipe

class NetworkContextMock: NetworkContextProtocol {
    var invokedConnect = false
    var invokedConnectCount = 0
    var invokedConnectParameters: (httpRequest: HttpRequest, Void)?
    var invokedConnectParametersList = [(httpRequest: HttpRequest, Void)]()
    var stubbedConnectServiceControllerCallbackResult: (NetworkOutcome, Void)?
    func connect(httpRequest: HttpRequest, 
                 serviceControllerCallback: @escaping (NetworkOutcome) -> Void) {
        invokedConnect = true
        invokedConnectCount += 1
        invokedConnectParameters = (httpRequest, ())
        invokedConnectParametersList.append((httpRequest, ()))
        if let result = stubbedConnectServiceControllerCallbackResult {
            serviceControllerCallback(result.0)
        }
    }

    var invokedConnectWithRetry = false
    var invokedConnectWithRetryCount = 0
    var stubbedConnectWithRetryServiceControllerCallbackResult: (NetworkOutcome, Void)?
    func connectWithRetry(httpRequest: HttpRequest, 
                          retries: Int, serviceControllerCallback: @escaping (NetworkOutcome) -> Void) {
        invokedConnectWithRetry = true
        invokedConnectWithRetryCount += 1
        if let result = stubbedConnectWithRetryServiceControllerCallbackResult {
            serviceControllerCallback(result.0)
        }
    }
}

