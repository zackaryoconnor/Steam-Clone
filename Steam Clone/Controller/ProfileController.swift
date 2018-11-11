//
//  ProfileController.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/11/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

private let profileReuseIdentifier = "Cell"
private let profileHeaderViewReuseIdentifier = "HeaderCell"

class ProfileController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = steamBlue
        // change the cell!!!!
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: profileReuseIdentifier)
        self.collectionView!.register(ProfileHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: profileHeaderViewReuseIdentifier)
        
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barTintColor = steamBlue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let testHeaderCell = self.collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath.init(row: 0, section: 0))
        
        if(velocity.y>0) {
            UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions(), animations: {
                let profileImageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
                imageview.image = UIImage(named: "DSC_8137")
                imageview.contentMode = UIView.ContentMode.scaleAspectFill
                imageview.layer.cornerRadius = 4
                imageview.layer.masksToBounds = true
                profileImageContainerView.addSubview(imageview)
                
                let navBarProfileImageView = UIBarButtonItem(customView: profileImageContainerView)
                
                let navBarUserNameLabel : UIBarButtonItem
                navBarUserNameLabel = UIBarButtonItem(title: "Buttermilk O'Connor", style: .plain, target: self, action: nil)
                
                self.navigationItem.setLeftBarButtonItems([navBarProfileImageView, navBarUserNameLabel], animated: true)
                
                self.navigationController?.navigationBar.barTintColor = steamBlue
                self.navigationController?.navigationBar.isTranslucent = true
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            
                testHeaderCell!.isHidden = true
                
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions(), animations: {
                
                testHeaderCell!.isHidden = false
                
                self.navigationItem.title = nil
                self.navigationItem.leftBarButtonItems = nil
                self.setupNavBar()
            }, completion: nil)
        }
    }
}


extension ProfileController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileReuseIdentifier, for: indexPath)
        
        return cell
    }
}

extension ProfileController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 232)
    }
}

// header cell
extension ProfileController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: profileHeaderViewReuseIdentifier, for: indexPath) as? ProfileHeaderCell
        return headerCell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 275)
    }
}
