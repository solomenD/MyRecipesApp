//
//  RecipeDetailsViewController.swift
//  RecipesDemo
//
//  Created by Solomon  on 24.11.2022.
//

import UIKit
import SDWebImage

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var titleLableRecipe: UILabel!
    @IBOutlet weak var imageRecipe: UIImageView!
    
    @IBOutlet weak var DetailsLable: UILabel!
    
    var titleLable = ""
    var imageString = ""
    var detailslabel = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL = URL(string: imageString)
        DetailsLable.text = detailslabel
        titleLableRecipe.text = titleLable
        imageRecipe.sd_setImage(with: imageURL)
        imageRecipe.layer.cornerRadius = 15
        imageRecipe.layer.shadowColor = UIColor.black.cgColor
        imageRecipe.layer.shadowRadius = 7.0
        imageRecipe.layer.shadowOpacity = 0.7
        imageRecipe.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        imageRecipe.clipsToBounds = true
        
        
    }
    


}
