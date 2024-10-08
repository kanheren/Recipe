//
//  RecipeTableView+Extension.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
import UIKit

// MARK: - UITableView Delegate
// Extensions for table view Delegate and Data source
extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        //Set delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "RecipeTableViewCell"
        
        // cell
        tableView?.register(UINib(nibName: "RecipeTableViewCell", bundle: nil),
                            forCellReuseIdentifier: "RecipeTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getRecipeDataModelCount() ?? 0
    }
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        120.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell",
                                                    for: indexPath) as? RecipeTableViewCell {
            let recipe = presenter?.getRecipeDataModel()[indexPath.row]
           
            cell.countryName.text = recipe?.cuisine
            cell.cuisineName.text = recipe?.name
            cell.imageName.downloaded(from: recipe?.photo_url_small ?? "")
            
            let tempCount = presenter?.getRecipeDataModelCount() ?? 0
            if indexPath.row == tempCount - 1 {
                cell.separatorView.isHidden = true

            } else {
                cell.separatorView.isHidden = false
            }
            
            return cell
        } else {
            return RecipeTableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected Section = \(indexPath.section) and Row = \(indexPath.row)")
        NavigateToRecipeDetailsScreen(rowIndex: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
