//
//  OwnedGamesCell.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/11/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class OwnedGamesCell: UICollectionViewCell {
    
    let ownedGameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "left-4-dead-2")
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        addSubview(ownedGameImageView)
        
        ownedGameImageView.addAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 2, bottom: 20, right: 2))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

