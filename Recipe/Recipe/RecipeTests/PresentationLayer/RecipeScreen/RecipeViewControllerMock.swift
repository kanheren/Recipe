//
//  RecipeViewControllerMock.swift
//  RecipeTests
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
@testable import Recipe

class RecipeViewControllerMock: RecipeViewController_ViewControllerProtocol {
    
    var invokedUpdateView = false
    var invokedHUpdateViewCount = 0
    func UpdateView() {
        invokedUpdateView = true
        invokedHUpdateViewCount += 1
    }
    
    var invokedshowAlertWith = false
    var invokedHshowAlertWithCount = 0
    func showAlertWith(titleText: String, messageText: String) {
        invokedshowAlertWith = true
        invokedHshowAlertWithCount += 1
    }
}

