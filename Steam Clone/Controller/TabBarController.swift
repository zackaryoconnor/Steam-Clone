//
//  TabBarController.swift
//  Steam Clone
//
//  Created by Zackary O'Connor on 11/4/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class NavBarController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = tabBarColor
        tabBar.isTranslucent = false
        tabBar.tintColor = .white
        
        let layout = UICollectionViewFlowLayout()
        
        let homeController = NavBarController(rootViewController: HomeController(collectionViewLayout: layout))
        homeController.tabBarItem.image = UIImage(named: "home-icon")
        homeController.tabBarItem.selectedImage = UIImage(named: "home-selected-icon")
        homeController.title = "Home"
        
        let searchController = NavBarController(rootViewController: SearchController(collectionViewLayout: layout))
        searchController.tabBarItem.image = UIImage(named: "search-icon")
        searchController.tabBarItem.selectedImage = UIImage(named: "search-selected-icon")
        searchController.title = "Search"
        
        let profileController = NavBarController(rootViewController: ProfileController(collectionViewLayout: layout))
        profileController.tabBarItem.image = UIImage(named: "profile-icon")
        profileController.tabBarItem.selectedImage = UIImage(named: "profile-selected-image")
        profileController.title = "Profile"
        
        viewControllers = [homeController, searchController, profileController]
    }
}
