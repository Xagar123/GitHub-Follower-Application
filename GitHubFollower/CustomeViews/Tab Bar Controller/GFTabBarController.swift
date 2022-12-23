//
//  GFTabBarController.swift
//  GitHubFollower
//
//  Created by Admin on 21/12/22.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNC(),createFavoriteNC()]
        
    }
    
    func createSearchNC() -> UINavigationController{
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0) // 0 is the index
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoriteNC() -> UINavigationController{
        let favoriteVC = FavoriteListVC()
        favoriteVC.title = "Favorites"
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoriteVC)
    }
    
  


}
