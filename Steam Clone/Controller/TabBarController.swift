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
        
        viewControllers = [homeController]
    }
}
