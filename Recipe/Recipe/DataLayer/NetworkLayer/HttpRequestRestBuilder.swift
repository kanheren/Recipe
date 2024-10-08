//
//  HttpRequestRestBuilder.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

class HttpRequestRestBuilder: HttpRequestBuilder {
    required init(
        serviceName: String? = nil,
        serviceType: HttpRequest.ServiceType = .unknown,
        uri: String? = nil,
        method: HttpRequest.Method = .unknown,
        stringBody: String? = nil,
        dataBody: Data? = nil,
        needsCookies: Bool = false
    ) {
        super.init()
        httpRequest.serviceName = serviceName
        httpRequest.serviceType = serviceType
        httpRequest.uri = uri
        httpRequest.method = method
        httpRequest.body = stringBody
        httpRequest.dataBody = dataBody
        httpRequest.needsCookies = needsCookies
    }
    
    override func buildURI() {
        //var domain = ""
        switch httpRequest.serviceType {
        default:
            break
        }
        httpRequest.uri = httpRequest.uri?.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    override func buildBody() {
        httpRequest.body = httpRequest.body?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    override func buildHeaders() {
        switch httpRequest.serviceType {
        default:
            break
        }
    }
}
