//
//  BasicUI.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/4/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

let tabBarColor = UIColor(red:0.06, green:0.07, blue:0.09, alpha:1.00)
public let steamBlue = UIColor(red:0.09, green:0.10, blue:0.13, alpha:1.00)

let basicLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    return label
}()

let basicTitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
    return label
}()

let basicImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
}()

let basicButton: UIButton = {
    let button = UIButton()
    return button
}()

let basicHorizontalCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .clear
    
    return collectionView
}()
