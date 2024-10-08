//
//  Errors.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation


public struct Errors {
    // Errors
    public struct Response: Codable {
        public var message: String?
        public var error: String?
        public var status: Int?
    }
}
