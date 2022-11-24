//
//  ViewController.swift
//  RecipesDemo
//
//  Created by Solomon  on 22.11.2022.
//

import UIKit


class RecipesListViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let testArray = ["asdgas", "asdgas", "adsgas"]
    
    let mySearch: String = "=pizza"
    
    var arrayOfRecipes:[Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let headers = [
            "X-RapidAPI-Key": "3eb4b5a905msh63ca97e56b4c194p1e9b93jsna253a69a0357",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&q\(mySearch)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if error == nil && data != nil {
                
                
                let decode = JSONDecoder()
                
                do {
                    let resipis = try decode.decode(Recipes.self, from: data!)
                    self.arrayOfRecipes = resipis.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        print(resipis.results[16].description)
                    }
                } catch {
                    print(error)
                }
                
            }
            
            print("ITS OOOOKKEEEYY")
            
        })
        print(dataTask)
        
        dataTask.resume()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "RecipesTableViewCell", bundle: nil), forCellReuseIdentifier: "RecipesTableViewCell")
    }
    
    
}


extension RecipesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfRecipes.count
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayOfRecipes[indexPath.row].name!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as? RecipesTableViewCell else {return UITableViewCell()}


        let item = arrayOfRecipes[indexPath.row]
        cell.configure(item: item)
        cell.selectionStyle = .blue
        
        
        return cell
        
    }
    
    
}
