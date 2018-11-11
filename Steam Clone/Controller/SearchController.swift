//
//  SearchController.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/11/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

private let searchReuseIdentifier = "Cell"

class SearchController: UICollectionViewController {
    
    let searchCategories = ["New on Steam", "Adventure", "Action", "Casual", "Race", "Sports", "Strategy", "Indie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = steamBlue
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: searchReuseIdentifier)
        
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barTintColor = steamBlue
        navigationController?.navigationBar.isTranslucent = false
        
        let searchBar = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController?.searchBar.tintColor = .white
    }
}

extension SearchController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchCategories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchReuseIdentifier, for: indexPath) as? SearchCell
        cell?.searchLabel.text = searchCategories[indexPath.item]
        return cell!
    }
}

extension SearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
}
