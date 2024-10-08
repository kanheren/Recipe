//
//  AppEnvironment.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

class AppEnvironment {
    /// The global stack of environments.
    private static var stack = [Environment()]
    /// The most recent environment on the stack.
    public static var current: Environment {
        stack.last!
    }
    /// Pushes a new Environment onto the stack.
    static func push(_ environment: Environment) {
        stack.append(environment)
    }
    @discardableResult
    /// Pops an Environment off the stack.
    static func popEnvironment() -> Environment {
        guard stack.count > 1 else { return current }
        return stack.popLast() ?? current
    }
    /// Replaces the current environment with a new environment.
    static func replace(_ environment: Environment) {
        _ = stack.popLast()
        push(environment)
    }
}
