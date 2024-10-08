//
//  HttpRequestBuilder.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

class HttpRequestBuilder: HttpRequestBuilderDelegate {
    var httpRequest = HttpRequest()
    var userDefaults = UserDefaults.standard

    func buildURI() {
        NSException(name: NSExceptionName(rawValue: "Invoked abstract method"),
                    reason: "Invoked abstract method in FXSHttpRequestBuilder", userInfo: nil).raise()
    }

    func buildBody() {
        NSException(name: NSExceptionName(rawValue: "Invoked abstract method"),
                    reason: "Invoked abstract method in FXSHttpRequestBuilder", userInfo: nil).raise()
    }

    func buildHeaders() {
        NSException(name: NSExceptionName(rawValue: "Invoked abstract method"),
                    reason: "Invoked abstract method in FXSHttpRequestBuilder", userInfo: nil).raise()
    }

    func fetchHttpRequest() -> HttpRequest {
        httpRequest
    }
}
