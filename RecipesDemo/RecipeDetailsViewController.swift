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
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var videoButtonText: UIButton!
    @IBOutlet weak var tableViewIngradients: UITableView!
    
    var titleLable = ""
    var imageString = ""
    var detailslabel = ""
    var videoString = ""
    

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
        
        imageRecipe.clipsToBounds = true
        videoButtonText.layer.cornerRadius = 15
        
        navigationController?.navigationBar.isHidden = false
        
    }
    
    @IBAction func videoButton(_ sender: Any) {
        
        guard let videoURL = URL(string: videoString) else { return }
        
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.playerView.bounds
        self.playerView.layer.addSublayer(playerLayer)
        player.play()
        self.videoButtonText.isHidden = true
        if self.videoButtonText.isHidden {
            NSLayoutConstraint.activate([
                playerView.topAnchor.constraint(equalTo: DetailsLable.bottomAnchor, constant: 8)
            ])
        }
    }

}
