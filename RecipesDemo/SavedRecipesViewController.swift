//
//  SavedRecipesViewController.swift
//  RecipesDemo
//
//  Created by Solomon  on 01.12.2022.
//

import UIKit
import RealmSwift

class SavedRecipesViewController: UIViewController {
    
    var arrayOfSavedRecipes:[SaveModels] = []
    var savedModels = SaveModels().name
    let realm = try! Realm()
    var items = RecipeDetailsViewController().items
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // UITableView extension for registering cells
        
        let cellIdentifier = "\(RecipesTableViewCell.self)"
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
                
//        tableView.reloadData()
        
        

    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
}

extension SavedRecipesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        items = realm.objects(SaveModels.self)

        if items?.count != 0 {
            return items!.count
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as? RecipesTableViewCell else {return UITableViewCell()}

        let item = items?[indexPath.row]
        let imageURL = URL(string: item?.imageString ?? "images-3")
        cell.recipeImageView.sd_setImage(with: imageURL)
        cell.recipeNameLabel.contentMode = .scaleToFill
        cell.recipeNameLabel.numberOfLines = 2
        cell.recipeNameLabel.text = item?.name
        cell.recipeImageView.layer.cornerRadius = 8

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let namelabel = items?[indexPath.row].name
        let imageURL = items?[indexPath.row].imageString!
        let detailelabel = items?[indexPath.row].detailslabel ?? "none"
        let videoString = items?[indexPath.row].videoString ?? ""
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = main.instantiateViewController(withIdentifier: "RecipeDetailsViewController") as? RecipeDetailsViewController else { return }
        viewController.titleLable = namelabel!
        viewController.imageString = imageURL!
        viewController.detailslabel = detailelabel
        viewController.videoString = videoString
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableview: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        tableview.beginUpdates()
        tableview.delegate
        tableview.endUpdates()
    }
    
}
