//
//  Outcome.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

public enum ServiceOutcome<T> {
    case Success(T)
    case Error(ErrorResponseBaseClass)
}

public enum NetworkOutcome {
    case Success(HttpResponse)
    case Error(HttpResponse)
}

extension NetworkOutcome {
    func get() throws -> HttpResponse {
        switch self {
        case let .Success(value):
            return value
        case let .Error(error):
            print("error")
            return error
        }
    }
}
