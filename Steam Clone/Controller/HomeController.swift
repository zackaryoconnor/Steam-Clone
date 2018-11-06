//
//  ViewController.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/2/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.backgroundColor = .blue
        self.collectionView?.register(HomeCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setupNavBar()
    }
    
    func setupNavBar() {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 125, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 125, height: 30))
        imageView.image = UIImage(named: "steam-logo")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        containerView.addSubview(imageView)
        navigationItem.titleView = containerView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cart-icon"), style: .plain, target: self, action: nil)
        
        navigationItem.title = nil
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}

extension HomeController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HomeCell
        
        return cell!
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 232)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
    }
}


}
