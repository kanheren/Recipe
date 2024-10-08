//
//  ErrorResponseBaseClass.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

public struct ErrorResponseBaseClass {
    public var errors: [Errors]?
    
    public var message: String?
    public var error: String?
    public var status: Int?
}
