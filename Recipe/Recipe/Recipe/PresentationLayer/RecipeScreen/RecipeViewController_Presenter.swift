//
//  RecipeViewController_Presenter.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
import UIKit

protocol RecipeViewController_PresenterProtocol: AnyObject {
    func getRecipeDataModel() -> [RecipeStruct.RecipesData]
    func getRecipeDataModelCount() -> Int
}

class RecipeViewController_Presenter: RecipeViewController_PresenterProtocol {
    
    weak var viewController: RecipeViewController_ViewControllerProtocol?
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // Data Model
    var recipeDataModel = [RecipeStruct.RecipesData]()
    
    required init(_ viewController: RecipeViewController_ViewControllerProtocol) {
        self.viewController = viewController
        getRecipeRequest()
    }
    private func getRecipeRequest() {
        let request = RecipeStruct.Request()
        AppEnvironment.current.getRecipeUseCase.getRecipeResuest(request: request,
                                                                 completion: { [] result in
            switch result {
            case let .Success(successObject):
                print("Success object")
                self.recipeDataModel = successObject.recipes
                self.viewController?.UpdateView()
            case .Error(_):
                self.viewController?.showAlertWith(titleText: "Error", messageText: "Get Recipe API Error")
                print("Error object")
            }
        })
    }
    
    // MARK: -Delegate
    func getRecipeDataModel() -> [RecipeStruct.RecipesData] {
       return recipeDataModel
    }
    func getRecipeDataModelCount() -> Int {
        return recipeDataModel.count
    }
}
