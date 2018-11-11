//
//  ProfileCell.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/11/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

private let individualOwnedGamesReuseIdentifier = "Cell"

class ProfileCell: UICollectionViewCell {
    
    let owendCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "RECENTLY PLAYED"
        label.textColor = .white
        return label
    }()
    
    let ownedGamesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = steamBlue
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ownedGamesCollectionView.register(OwnedGamesCell.self, forCellWithReuseIdentifier: individualOwnedGamesReuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        backgroundColor = steamBlue
        
        [owendCategoryLabel, ownedGamesCollectionView].forEach { addSubview($0) }
        
        ownedGamesCollectionView.dataSource = self
        ownedGamesCollectionView.delegate = self
        
        owendCategoryLabel.addAnchors(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 32, left: 16, bottom: 0, right: 0))
        
        ownedGamesCollectionView.addAnchors(top: owendCategoryLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: individualOwnedGamesReuseIdentifier, for: indexPath) as? OwnedGamesCell
        return cell!
    }
}

extension ProfileCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = frame.width / 2 - 42
        let height = frame.height - 32
        
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
