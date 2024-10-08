//
//  RecipeSearchBar+Extension.swift
//  Recipe
//
//  Created by Nandkishore on 10/8/24.
//

import Foundation
import UIKit

// MARK: - UISearchResultsUpdating Delegate
extension RecipeViewController: UISearchBarDelegate {
    func hideMagnifyingGlass() {
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search...",
            attributes: [.foregroundColor: UIColor.white]
        )
    }
    func filterContentForSearchText(_ searchText: String) {
        let recipes = presenter?.getRecipeDataModel()
        
        if searchText != "" {
            // Show Filtered
            filteredRecipeDataModel = recipes?.filter { (listModel: RecipeStruct.RecipesData) -> Bool in
                return listModel.name?.lowercased().contains(searchText.lowercased()) ?? false
            } ?? []
        } else {
            // Show all
            filteredRecipeDataModel = recipes ?? []
        }
            
        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Dismiss keyboard
        searchBar.resignFirstResponder()
    }
}
