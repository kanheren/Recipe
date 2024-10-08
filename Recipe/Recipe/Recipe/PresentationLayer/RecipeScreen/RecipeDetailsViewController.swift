//
//  RecipeDetailsViewController.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation
import UIKit

class RecipeDetailsViewController: BaseViewController {
    
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var recipeDataModel: RecipeStruct.RecipesData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setBackgroundImage_Gradient_Light(view: self.view)
        
        SetUpUI()
    }
    func SetUpUI() {
        detailsTitle.text = recipeDataModel?.name
        countryName.text = recipeDataModel?.cuisine
        imageView.downloaded(from: recipeDataModel?.photo_url_small ?? "")
    }
    
    
    @IBAction func backButtonTap(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func watchOnYouTube(_ sender: Any) {
        UIApplication.shared.open(URL(string:recipeDataModel?.youtube_url ?? "")! as URL)
    }
}
