//
//  DataExtensions.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

extension Data {
    // Returns bytes array from Data
    var hexByteArray: [UInt8] {
        map { $0 }
    }
}

extension Data {
    // Formatting Request/Response in Pretty JSON form
    var prettyPrintedJSONString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = String(data: data, encoding: String.Encoding.utf8) else { return nil }

        return prettyPrintedString
    }
}
