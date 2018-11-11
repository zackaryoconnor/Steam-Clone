//
//  HomeHeaderCell.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/10/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

private let individualGamesHeaderReuseIdentifier = "HeaderCell"

class HomeHeaderCell: UICollectionViewCell {
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "FEATURED"
        label.textColor = .white
        return label
    }()
    
    let gamesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gamesCollectionView.register(IndividualGamesHeaderCell.self, forCellWithReuseIdentifier: individualGamesHeaderReuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        backgroundColor = .clear
        
        [categoryLabel, gamesCollectionView].forEach { addSubview($0) }
        
        gamesCollectionView.dataSource = self
        gamesCollectionView.delegate = self
        
        categoryLabel.addAnchors(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 64, left: 16, bottom: 0, right: 0))
        
        gamesCollectionView.addAnchors(top: categoryLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension HomeHeaderCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: individualGamesHeaderReuseIdentifier, for: indexPath) as? IndividualGamesHeaderCell
        
        return cell!
    }
}

extension HomeHeaderCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - 64, height: frame.height - 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
