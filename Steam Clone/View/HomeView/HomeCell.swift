//
//  HomeCell.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/4/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

private let individualGamesReuseIdentifier = "Cell"

class HomeCell: UICollectionViewCell {
    
    let categoryLabel = basicLabel
    let gamesCollectionView = basicHorizontalCollectionView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gamesCollectionView.delegate = self
        gamesCollectionView.dataSource = self
        gamesCollectionView.register(IndividualGamesCell.self, forCellWithReuseIdentifier: individualGamesReuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        backgroundColor = .red
        
        [categoryLabel, gamesCollectionView].forEach { addSubview($0) }
        
        categoryLabel.text = "NEW ON STEAM"
        categoryLabel.addAnchors(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 32, left: 16, bottom: 0, right: 0))
        
        gamesCollectionView.addAnchors(top: categoryLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 8, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: individualGamesReuseIdentifier, for: indexPath) as? IndividualGamesCell
        return cell!
    }
}

extension HomeCell: UICollectionViewDelegateFlowLayout {
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

