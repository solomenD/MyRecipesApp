//
//  RecipeDetailsViewController.swift
//  RecipesDemo
//
//  Created by Solomon  on 24.11.2022.
//

import UIKit
import SDWebImage
import AVKit
import RealmSwift

class RecipeDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLableRecipe: UILabel!
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var detailsLable: UILabel!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    var titleString = ""
    var imageString = ""
    var detailsString = ""
    var videoString = ""
    var countryString = ""
    let imageHeart = UIImage(systemName: Resourses.Images.heartImageString)
    let imageHeartFill = UIImage(systemName: Resourses.Images.heartFillImageString)
    var save = RecipesSavedModels()
    var items: Results<RecipesSavedModels>!
    
    var list = [RecipesSavedModels]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        
        let imageURL = URL(string: imageString)
        detailsLable.text = detailsString
        titleLableRecipe.text = titleString
        imageRecipe.sd_setImage(with: imageURL)
        imageRecipe.layer.cornerRadius = 15
        
        shadowView.layer.cornerRadius = 15
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 9.0
        shadowView.layer.shadowOpacity = 0.7
        shadowView.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        
        previewImage.sd_setImage(with: imageURL)
        previewImage.layer.opacity = 0.7
        previewImage.layer.cornerRadius = 10
        
        imageRecipe.clipsToBounds = true
        
        if videoString == "" {
            playButton.setImage(UIImage(named: Resourses.Images.xmarkImageString)?.withTintColor(.white), for: .normal)
        }else {
            playButton.setImage(UIImage(named: Resourses.Images.playButtonImageString), for: .normal)
        }
        
        navigationController?.navigationBar.isHidden = false
        
        navigationController?.navigationBar.tintColor = .label
        
        let realm = try! Realm()
        
        //MARK: - To open realm studio
        print(Realm.Configuration.defaultConfiguration.fileURL ?? Resourses.nonResult)
        
        items = realm.objects(RecipesSavedModels.self)
        
        let results = items.filter("\(Resourses.realnNameContains) '\(String(titleString))' ")
        
        if results.count > 0 {
            
            rigthRedHeart(image: imageHeartFill!, color: .red, selector: #selector(didTapForHeart))
            
        } else {
            
            rigthRedHeart(image: imageHeart!, color: .label, selector: #selector(tapForHeart))
            
        }
        
    }
    
    @objc func tapForHeart() {
        rigthRedHeart(image: imageHeartFill!, color: .red, selector: #selector(didTapForHeart))
        
        save.name = titleString
        save.imageString = imageString
        save.videoString = videoString
        save.contry = countryString
        save.detailslabel = detailsString
        save.isItSave = true
        
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(save)
        }
        
    }
    
    @objc func didTapForHeart() {
        rigthRedHeart(image: imageHeart!, color: .label, selector: #selector(tapForHeart))
        
        //Dont Work
        
        let realm = try! Realm()
        
        items = realm.objects(RecipesSavedModels.self)
        
        let results = items.filter("\(Resourses.realnNameContains) '\(String(titleString))' ")
        
        try! realm.write{
            realm.delete(results)
        }
                
    }
    
    @IBAction func videoButton(_ sender: Any) {
        
        guard let videoURL = URL(string: videoString) else { return }
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerViewController()
        playerLayer.player = player
        self.present(playerLayer, animated: true) {
            playerLayer.player?.play()
        }
    }
}

extension RecipeDetailsViewController {
    func rigthRedHeart(image: UIImage, color: UIColor, selector: Selector) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image,
                                                                 style: .done,
                                                                 target: self,
                                                                 action: selector)
        self.navigationItem.rightBarButtonItem?.tintColor = color
    }
}

