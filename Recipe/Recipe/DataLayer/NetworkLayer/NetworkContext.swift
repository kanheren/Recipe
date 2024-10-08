//
//  NetworkContext.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

protocol NetworkContextProtocol {
    func connect(httpRequest: HttpRequest, serviceControllerCallback: @escaping (NetworkOutcome) -> Void)
}

class FXSNetworkContext: NetworkContextProtocol {
    // PROPERTIES
    var networkStrategy: NetworkStrategy!
    var requestTime: Date!
    var httpRequest: HttpRequest!

    var serviceControllerCallback: ((NetworkOutcome) -> Void)?

    // CUSTOM INITIALIZER
    init(withStrategy networkStrategy: NetworkStrategy) {
        self.networkStrategy = networkStrategy
    }
    
    func connect(httpRequest: HttpRequest, serviceControllerCallback: @escaping (NetworkOutcome) -> Void) {
        self.serviceControllerCallback = serviceControllerCallback

        requestTime = Date()
        self.httpRequest = httpRequest

        // If the stored API token for FDMi or FedEx is nil, renew the token before making a backend call
        networkStrategy.connect(httpRequest: self.httpRequest, contextCallback: { response in

            let outcome: NetworkOutcome = response
            switch outcome {
            case let .Success(successObject):
                self.didReceiveResponse(successObject)
            case let .Error(error):
                self.didReceiveError(error)
                print(error)
            }
        })
    }
    
    // callback to service controller with success
    func didReceiveResponse(_ response: HttpResponse) {
        let outcome: NetworkOutcome = .Success(response)
        if let serviceContCallback = serviceControllerCallback {
            performUIUpdate {
                serviceContCallback(outcome)
            }
        }
    }
    // callback to service controller with error
    func didReceiveError(_ response: HttpResponse) {
        let outcome = NetworkOutcome.Error(response)
        if let serviceContCallback = serviceControllerCallback {
            performUIUpdate {
                serviceContCallback(outcome)
            }
        }
    }
}
