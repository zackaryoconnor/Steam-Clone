//
//  IndividualGamesCell.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/5/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class IndividualGamesCell: UICollectionViewCell {
    
    let gameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "pubg")
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        label.text = "25"
        label.textColor = UIColor(red:0.45, green:0.76, blue:0.13, alpha:1.00)
        label.textAlignment = .center
        label.layer.cornerRadius = 16
        label.layer.maskedCorners = .layerMinXMinYCorner
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        addSubview(gameImageView)
        gameImageView.addSubview(priceLabel)
        
        gameImageView.addAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 2, bottom: 20, right: 2))
        
        priceLabel.addAnchors(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 0), size: .init(width: 70, height: 36))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
