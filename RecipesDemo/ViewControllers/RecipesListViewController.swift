//
//  ViewController.swift
//  RecipesDemo
//
//  Created by Solomon  on 22.11.2022.
//

import UIKit
import Lottie

class RecipesListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "\(RecipesTableViewCell.self)"
    
    var arrayOfRecipes:[Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadResults(query: "Pizza")
//        fetchRecipeData(query: "pasta")
                
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        // UITableView extension for registering cells
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
    }
    
    func loadResults(query: String){
        
        self.tableView.tableHeaderView = createSpinerCenter()
        
        NetworkService.shared.loadRecipes(query: query) { resipis in
            self.arrayOfRecipes = resipis
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.tableHeaderView = nil
            }
        }
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
        
        let namelabel = arrayOfRecipes[indexPath.row].name ?? Resourses.nonResult
        let imageURL = arrayOfRecipes[indexPath.row].thumbnail_url ?? Resourses.nonResult
        let detailelabel = arrayOfRecipes[indexPath.row].description ?? Resourses.nonResult
        let countryNamed = arrayOfRecipes[indexPath.row].country ?? Resourses.nonResult
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = main.instantiateViewController(withIdentifier: "\(RecipeDetailsViewController.self)") as? RecipeDetailsViewController else { return }
        viewController.titleString = namelabel
        viewController.imageString = imageURL
        viewController.detailsString = detailelabel
        viewController.countryString = countryNamed
        viewController.videoString = arrayOfRecipes[indexPath.row].video_url ?? Resourses.nonResult
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RecipesTableViewCell else {return UITableViewCell()}

        let item = arrayOfRecipes[indexPath.row]
        cell.configure(item: item)
        cell.selectionStyle = .blue
        
        return cell
        
    }
     
    //MARK: - Spiner Anomation
    private func createSpinerCenter() -> UIView {
        let loadingLable = UILabel()
        loadingLable.text = Resourses.loadingString
        var animationView: LottieAnimationView
        animationView = .init(name: Resourses.loadingAnimationName)
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        animationView.play ()
        
        let centerView = UIView(frame: CGRect(x: 0, y: 200, width: view.frame.size.width, height: 200))
        centerView.addSubview(animationView)
        centerView.addSubview(loadingLable)
        animationView.frame = centerView.frame
        loadingLable.frame = CGRect(x: centerView.center.x-50, y: 380, width: 100, height: 50)
        loadingLable.textAlignment = .center
        loadingLable.textColor = .gray

        return centerView
    }
    
}

extension RecipesListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            arrayOfRecipes = []
            tableView.reloadData()
            loadResults(query: text)
        }
    }
}
