//
//  RecipesTableViewCell.swift
//  RecipesDemo
//
//  Created by Solomon  on 23.11.2022.
//

import UIKit
import SDWebImage

class RecipesTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
    }

    func configure(item: Result) {
        let imageURL = URL(string: item.thumbnail_url ?? "images-3")
        recipeImageView.sd_setImage(with: imageURL)
        recipeNameLabel.contentMode = .scaleToFill
        recipeNameLabel.numberOfLines = 2
        recipeNameLabel.text = item.name
        recipeImageView.layer.cornerRadius = 8
        
    }
    
}
