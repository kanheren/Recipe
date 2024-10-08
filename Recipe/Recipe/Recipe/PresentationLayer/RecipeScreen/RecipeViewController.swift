//
//  RecipeViewController.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
import UIKit

protocol RecipeViewController_ViewControllerProtocol: AnyObject {
    func UpdateView()
    func showAlertWith(titleText: String, messageText:String)
}

class RecipeViewController: BaseViewController, RecipeViewController_ViewControllerProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: RecipeViewController_PresenterProtocol?
    var filteredRecipeDataModel = [RecipeStruct.RecipesData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Set presentor
        presenter = RecipeViewController_Presenter(self)
        
        setUpNavigationBar()
        setBackgroundImage_Gradient_Light(view: self.view)
        
        configureTableView()
    }
    func NavigateToRecipeDetailsScreen(rowIndex: Int) {
        let selectedRecipe = filteredRecipeDataModel[rowIndex]
        let recipes = presenter?.getRecipeDataModel() ?? []
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "RecipeDetailsViewController") as? RecipeDetailsViewController {
            for recipe in recipes {
                if selectedRecipe.name == recipe.name {
                    viewController.recipeDataModel = recipe
                }
            }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: -Delegate
    func UpdateView() {
        performUIUpdate() {
            self.filteredRecipeDataModel = self.presenter?.getRecipeDataModel() ?? []
            self.tableView.reloadData()
        }
    }
    
    // MARK: -Action
    @IBAction func backButtonTap(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
}
