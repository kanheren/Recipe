//
//  HttpRequestDirector.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

class HttpRequestDirector {
    var httpRequestBuilder: HttpRequestBuilder!

    init(HTTPRequestBuilder: HttpRequestBuilder) {
        self.httpRequestBuilder = HTTPRequestBuilder
    }

    func constructHTTPRequest() -> HttpRequest {
        httpRequestBuilder.buildURI()
        httpRequestBuilder.buildBody()
        httpRequestBuilder.buildHeaders()

        return httpRequestBuilder.httpRequest
    }
    func constructHTTPRequestVirtual() -> HttpRequest {
        httpRequestBuilder.buildBody()
        httpRequestBuilder.buildHeaders()

        return httpRequestBuilder.httpRequest
    }
}
