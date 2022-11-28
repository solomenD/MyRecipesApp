//
//  ShadowView.swift
//  RecipesDemo
//
//  Created by Solomon  on 26.11.2022.
//

import UIKit

class ShadowView: UIView {
    private let imageView = UIImageView()
    
    var image: UIImage? {
        didSet {
            imageView.image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setoupShadow()
        
    }
    
    private func setoupShadow() {
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 7.0
        imageView.layer.shadowOpacity = 0.7
        imageView.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
    }
    
    private func setup() {
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
    }
}
