//
//  SavedRecipesViewController.swift
//  RecipesDemo
//
//  Created by Solomon  on 01.12.2022.
//

import UIKit

class SavedRecipesViewController: UIViewController {
    
    var arrayOfSavedRecipes:[Result] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   

}

extension SavedRecipesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfSavedRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as? RecipesTableViewCell else {return UITableViewCell()}

        let item = arrayOfSavedRecipes[indexPath.row]
        cell.configure(item: item)
        cell.selectionStyle = .blue
        
        return cell

    }
    
}
