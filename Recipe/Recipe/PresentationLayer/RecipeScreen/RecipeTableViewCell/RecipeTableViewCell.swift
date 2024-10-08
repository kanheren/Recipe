//
//  RecipeTableViewCell.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var cuisineName: UILabel!
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
