//
//  HomeHeaderCell.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/5/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class HomeHeaderCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeader()
    }
    
    func setupHeader() {
        backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
