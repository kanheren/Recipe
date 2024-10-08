//
//  Recipe.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

public struct RecipeStruct {
    
    // Response
    public struct Response: Codable {
        var recipes : [RecipesData]
    }
    public struct RecipesData: Codable {
        var cuisine: String?
        var name: String?
        var photo_url_large: String?
        var photo_url_small: String?
        var source_url: String?
        var uuid: String?
        var youtube_url: String?
    }
    
    // Request
    public struct Request: Codable {
        var id: String?
    }
}
