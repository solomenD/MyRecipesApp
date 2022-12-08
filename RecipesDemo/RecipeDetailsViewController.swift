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
    @IBOutlet weak var DetailsLable: UILabel!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    var titleLable = ""
    var imageString = ""
    var detailslabel = ""
    var videoString = ""
    let imageHeart = UIImage(systemName: "heart")
    let imageHeartFill = UIImage(systemName: "heart.fill")
    var save = SaveModels()
    var items: Results<SaveModels>!
    
    //Test
    var list = [SaveModels]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        
        let imageURL = URL(string: imageString)
        DetailsLable.text = detailslabel
        titleLableRecipe.text = titleLable
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
            playButton.setImage(UIImage(named: "xmark")?.withTintColor(.white), for: .normal)
        }else {
            playButton.setImage(UIImage(named: "play_button"), for: .normal)
        }
        
        navigationController?.navigationBar.isHidden = false
        
        navigationController?.navigationBar.tintColor = .label
        
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        items = realm.objects(SaveModels.self)
        
        let results = items.filter("name contains '\(String(titleLable))' ")
        
        if results.count > 0 {
            
            rigthRedHeart(image: imageHeartFill!, color: .red, selector: #selector(didTapForHeart))
            
        } else {
            
            rigthRedHeart(image: imageHeart!, color: .label, selector: #selector(tapForHeart))
            
        }
        
    }
    
    @objc func tapForHeart() {
        rigthRedHeart(image: imageHeartFill!, color: .red, selector: #selector(didTapForHeart))
        
        save.name = titleLable
        save.imageString = imageString
        save.videoString = videoString
        save.contry = "us"
        save.detailslabel = detailslabel
        save.isItSave = true
        
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(save)
        }
        print(save.name)
        
    }
    
    @objc func didTapForHeart() {
        rigthRedHeart(image: imageHeart!, color: .label, selector: #selector(tapForHeart))
        
        //Dont Work
        
        let realm = try! Realm()
        
        let results = items.filter("name contains '\(String(titleLable))' ")
        
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

//MARK: - Not working with format video ??
//    func getthumbnailFromImage(url: URL, completion: @escaping ((_ image: UIImage)-> Void)) {
//        DispatchQueue.global ().async {
//            let asset = AVAsset (url: url)
//            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
//            avAssetImageGenerator.appliesPreferredTrackTransform = true
//            let thumbnailTime = CMTimeMake(value: 7, timescale: 1)
//            do {
//                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumbnailTime,
//                                                                         actualTime: nil)
//                let thumbImage = UIImage (cgImage: cgThumbImage)
//                DispatchQueue.main.async {
//                    completion(thumbImage)
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }

