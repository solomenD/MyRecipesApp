//
//  RecipeDetailsViewController.swift
//  RecipesDemo
//
//  Created by Solomon  on 24.11.2022.
//

import UIKit
import SDWebImage
import AVKit

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
        
        didTapForHeart()
        
    }
    
    @objc func tapForHeart() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: imageHeartFill,
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(didTapForHeart))
        self.navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    @objc func didTapForHeart() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: imageHeart,
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(tapForHeart))
        self.navigationItem.rightBarButtonItem?.tintColor = .label
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
    
}
