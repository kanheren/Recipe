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
        filteredRecipeDataModel = self.presenter?.getRecipeDataModel() ?? []
        
        if filteredRecipeDataModel.count != 0 {
            performUIUpdate() {
                self.filteredRecipeDataModel = self.presenter?.getRecipeDataModel() ?? []
                self.tableView.reloadData()
            }
        } else {
            showAlertWith(titleText: "Error", messageText: "\nEmpty, No recipes are available to show.")
        }
    }
    
    // MARK: -Action
    @IBAction func backButtonTap(_ sender: Any) {
        performUIUpdate {
            // Confirmation from the user
            let alert = UIAlertController(title: "Alert!!!", message: "Are you sure to exit?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) {_ in }) // no acton
            alert.addAction(UIAlertAction(title: "Ok", style: .default) {_ in
                if let navController = self.navigationController {
                    navController.popViewController(animated: true)
                }
            })
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func refreshButtonTap(_ sender: Any) {
        performUIUpdate {
            // Confirmation from the user
            let alert = UIAlertController(title: "Alert!!!", message: "Do you really want to refresh?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) {_ in }) // no acton
            alert.addAction(UIAlertAction(title: "Ok", style: .default) {_ in
                self.presenter?.getRecipeRequest()
            })
            self.present(alert, animated: true)
        }
    }
    
}
