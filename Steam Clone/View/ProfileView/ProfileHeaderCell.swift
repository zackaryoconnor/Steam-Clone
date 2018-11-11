//
//  ProfileHeaderCell.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/11/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DSC_8137")
        imageView.backgroundColor = .yellow
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Buttermilk O'Connor"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    let numberOfBadgesLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = .white
        label.font = .systemFont(ofSize: 36, weight: .medium)
        return label
    }()
    
    let badgesLabel: UILabel = {
        let label = UILabel()
        label.text = "Badges"
        label.textColor = .white
        return label
    }()
    
    let numberOfGamesLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.textColor = .white
        label.font = .systemFont(ofSize: 36, weight: .medium)
        return label
    }()
    
    let gamesLabel: UILabel = {
        let label = UILabel()
        label.text = "Games"
        label.textColor = .white
        return label
    }()
    
    let numberOfFriendsLabel: UILabel = {
        let label = UILabel()
        label.text = "500"
        label.textColor = .white
        label.font = .systemFont(ofSize: 36, weight: .medium)
        return label
    }()
    
    let friendsLabel: UILabel = {
        let label = UILabel()
        label.text = "Friends"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        backgroundColor = steamBlue
        
        [profileImageView, userNameLabel, numberOfBadgesLabel, badgesLabel, numberOfGamesLabel, gamesLabel, numberOfFriendsLabel, friendsLabel].forEach { addSubview($0) }
        
        profileImageView.addAnchors(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 100))
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        userNameLabel.addAnchors(top: profileImageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        userNameLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        
        numberOfBadgesLabel.addAnchors(top: nil, leading: nil, bottom: badgesLabel.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 8, right: 0))
        numberOfBadgesLabel.centerXAnchor.constraint(equalTo: badgesLabel.centerXAnchor).isActive = true
        
        badgesLabel.addAnchors(top: nil, leading: nil, bottom: bottomAnchor, trailing: gamesLabel.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 75))
        
        numberOfGamesLabel.addAnchors(top: nil, leading: nil, bottom: gamesLabel.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 8, right: 0))
        numberOfGamesLabel.centerXAnchor.constraint(equalTo: gamesLabel.centerXAnchor).isActive = true
        
        gamesLabel.addAnchors(top: nil, leading: nil, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 16, right: 0))
        gamesLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        numberOfFriendsLabel.addAnchors(top: nil, leading: nil, bottom: friendsLabel.topAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 8, right: 0))
        numberOfFriendsLabel.centerXAnchor.constraint(equalTo: friendsLabel.centerXAnchor).isActive = true
        
        friendsLabel.addAnchors(top: nil, leading: gamesLabel.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 75, bottom: 16, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

