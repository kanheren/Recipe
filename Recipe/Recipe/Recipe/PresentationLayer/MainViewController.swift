//
//  MainViewController.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func NavigateToRecipeScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "RecipeViewController") as? RecipeViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}
