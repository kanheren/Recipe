//
//  HttpResponse.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

public class HttpResponse {
    var data: Data?
    var httpURLResponse: HTTPURLResponse?
    var timeOfResponse: Date?

    init(data: Data?, httpURLResponse: HTTPURLResponse?, timeOfResponse: Date?) {
        self.data = data
        self.httpURLResponse = httpURLResponse
        self.timeOfResponse = timeOfResponse
    }
}
