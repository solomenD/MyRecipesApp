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
    var items = RecipeDetailsViewController().items
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // UITableView extension for registering cells
        
        let cellIdentifier = "\(RecipesTableViewCell.self)"
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        print(SaveModels().name ?? "Is not")

    }
   

}

extension SavedRecipesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items?.count != 0 {
            return items!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as? RecipesTableViewCell else {return UITableViewCell()}

        let item = arrayOfSavedRecipes[indexPath.row]
//        cell.configure(item: item)
        cell.selectionStyle = .blue

        return cell
        
    }
    
}
