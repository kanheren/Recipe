//
//  StringExtension.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

extension String {
    /// Encode a string for use in JSON request
    /// This is only used when adding values into
    /// a JSON template. Do not use in combination
    /// with object mapper requests.
    ///
    /// - returns: json encoded text
    public func jsonEncode() -> String {
        var jsonEncodedString = self
        
        // handle backslash (\)
        jsonEncodedString = jsonEncodedString.replacingOccurrences(of: "\\", with: "\\\\")
        
        // handle double quote (")
        jsonEncodedString = jsonEncodedString.replacingOccurrences(of: "\"", with: "\\\"")
        
        return jsonEncodedString
    }
    
    public static func isNilOrEmpty(_ string: String?) -> Bool {
        var result: Bool = true
        
        if string != nil, !(string!.isEmpty) {
            result = false
        }
        
        return result
    }
    
    mutating func until(_ string: String) {
        let components = self.components(separatedBy: string)
        self = components[0]
    }

    var lowerCasing: String { prefix(1).lowercased() + dropFirst() }
    var upperCasing: String { prefix(1).uppercased() + dropFirst() }
    
    var camelCase: String {
        guard !isEmpty else { return "" }
        let parts = components(separatedBy: .alphanumerics.inverted)
        let first = parts.first!.lowerCasing
        let rest = parts.dropFirst().map { $0.upperCasing }
        
        return ([first] + rest).joined()
    }
}
