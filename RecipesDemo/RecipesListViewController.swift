//
//  ViewController.swift
//  RecipesDemo
//
//  Created by Solomon  on 22.11.2022.
//

import UIKit


class NetworkService {
    private init() { }
    static let shared = NetworkService()
    
    func loadRecipes() {
        
    }
}

class RecipesListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfRecipes:[Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.loadRecipes()
        
        fetchRecipeData(query: "pasta")
                
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        // UITableView extension for registering cells
        
        let cellIdentifier = "\(RecipesTableViewCell.self)"
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    //In other Class
    func fetchRecipeData(query: String){
        
        let headers = [
            "X-RapidAPI-Key": "3eb4b5a905msh63ca97e56b4c194p1e9b93jsna253a69a0357",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        let baseURL = "https://tasty.p.rapidapi.com/recipes/list?from=0&size="
        let countOfResults = 20
        
        let request = NSMutableURLRequest(url: NSURL(string: "\(baseURL)\(String(countOfResults))&q=\(query)")! as URL,
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
                    }
                } catch {
                    print(error)
                }
                
            }
            
            print("ITS OOOOKKEEEYY")
            
        })
        print(dataTask)
        
        dataTask.resume()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension RecipesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfRecipes.count
    }
    
    // Router / Coordinator
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let namelabel = arrayOfRecipes[indexPath.row].name!
        let imageURL = arrayOfRecipes[indexPath.row].thumbnail_url!
        let detailelabel = arrayOfRecipes[indexPath.row].description ?? "none"
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = main.instantiateViewController(withIdentifier: "RecipeDetailsViewController") as? RecipeDetailsViewController else { return }
        viewController.titleLable = namelabel
        viewController.imageString = imageURL
        viewController.detailslabel = detailelabel
        viewController.videoString = arrayOfRecipes[indexPath.row].video_url ?? ""
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesTableViewCell", for: indexPath) as? RecipesTableViewCell else {return UITableViewCell()}

        let item = arrayOfRecipes[indexPath.row]
        cell.configure(item: item)
        cell.selectionStyle = .blue
        
        return cell
        
    }
    
}

extension RecipesListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            arrayOfRecipes = []
            tableView.reloadData()
            fetchRecipeData(query: text)
        }
    }
}
