//
//  HttpRequestBuilderDelegate.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

protocol HttpRequestBuilderDelegate: AnyObject {

    var httpRequest: HttpRequest { get set }
    
    func buildURI()
    func buildBody()
    func buildHeaders()
}
