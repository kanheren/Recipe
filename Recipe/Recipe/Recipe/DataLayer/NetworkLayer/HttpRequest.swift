//
//  HttpRequest.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

@objc
class HttpRequest: NSObject {
    
    var uri: String?
    var method: HttpRequest.Method
    var headers: [String: String]?
    var body: String?
    // Body of the request serialized as Data. Useful when needing to make mulipart form requests.
    var dataBody: Data?
    var timeout: Int
    var serviceType: HttpRequest.ServiceType
    var serviceName: String?
    var timeOfRequest: Date?
    var needsCookies: Bool
    
    struct FXSHttpRequestConstants {
        static let kUri = "uri"
        static let kMethod = "method"
        static let kHeaders = "headers"
        static let kBody = "body"
        static let kDataBody = "dataBody"
        static let kTimeout = "timeout"
        static let kServiceType = "serviceType"
        static let kTimeOfRequest = "timeOfRequest"
        static let kRetryCount = 5
    }

    override init() {
        self.uri = ""
        self.method = .unknown
        self.headers = [String: String]()
        self.body = ""
        self.timeout = 30
        self.serviceType = .unknown
        self.serviceName = ""
        self.timeOfRequest = nil
        self.needsCookies = false
    }

    override var description: String {
        "\(dictionaryRepresentation())"
    }
    
    enum Method: Int {
        case unknown
        case delete
        case get
        case post
        case put
    }
    
    @objc
    enum ServiceType: Int {
        case unknown
        case external
    }
    
    func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        dictionary[FXSHttpRequestConstants.kUri] = uri
        dictionary[FXSHttpRequestConstants.kHeaders] = headers

        if let dataBody = dataBody {
            var dataBodyOutput = dataBody.map { String(format: "%02x", $0) }.joined()
            let dataString = String(data: dataBody, encoding: .utf8) ?? "**UNABLE TO CONVERT DATA TO STRING**"
            dataBodyOutput += " --> \(dataString)"
            dictionary[FXSHttpRequestConstants.kDataBody] = dataBodyOutput
        } else {
            dictionary[FXSHttpRequestConstants.kBody] = body
        }

        dictionary[FXSHttpRequestConstants.kTimeout] = timeout

        switch method {
        case .unknown:
            dictionary[FXSHttpRequestConstants.kMethod] = "Unknown"
        case .delete:
            dictionary[FXSHttpRequestConstants.kMethod] = "Delete"
        case .get:
            dictionary[FXSHttpRequestConstants.kMethod] = "Get"
        case .post:
            dictionary[FXSHttpRequestConstants.kMethod] = "Post"
        case .put:
            dictionary[FXSHttpRequestConstants.kMethod] = "Put"
        }

        switch serviceType {
        case .unknown:
            dictionary[FXSHttpRequestConstants.kServiceType] = "Unknown"
        case .external:
            dictionary[FXSHttpRequestConstants.kServiceType] = "External"
        }

        return dictionary
    }
}
