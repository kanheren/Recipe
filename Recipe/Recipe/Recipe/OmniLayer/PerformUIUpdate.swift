//
//  PerformUIUpdate.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
/// "An alternative technique that we can use (to DispatchQueue.main) that enables us to always perform UI
/// updates on the main thread, while still being able to keep our tests stable and predictable."
///
/// Reference:
/// https://www.swiftbysundell.com/articles/reducing-flakiness-in-swift-tests/#jumping-queues
func performUIUpdate(using closure: @escaping () -> Void) {
    // If we are already on the main thread, execute the closure directly
    if Thread.isMainThread {
        closure()
    } else {
        DispatchQueue.main.async(execute: closure)
    }
}
