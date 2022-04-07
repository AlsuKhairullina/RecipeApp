//
//  TabBarCoordinator.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 26.03.2022.
//

import UIKit

final class TabBarCoordinator: CoordinatorProtocol {
     
    enum TabFlow {
        case openHomeTab
        case openSearchTab
        case openCreateTab
        case openProfileTab
    }
    
    var parentCoordinator: AppCoordinator?
    
    lazy var homeCoordinator: HomeCoordinator = HomeCoordinator()
    lazy var ordersCoordinator: SearchCoordinator = SearchCoordinator()
    lazy var addCoordinator: AddRecipeCoordinator = AddRecipeCoordinator()
    lazy var profileCoordinator: ProfileCoordinator = ProfileCoordinator()
    
    lazy var rootViewController = UITabBarController()
    
    func navigate(with route: TabFlow) {
        switch route {
        case .openHomeTab:
            rootViewController.selectedIndex = 0
        case .openSearchTab:
            rootViewController.selectedIndex = 1
        case .openCreateTab:
            rootViewController.selectedIndex = 2
        case .openProfileTab:
            rootViewController.selectedIndex = 3
        }
    }
    
    func configureMainController() -> UIViewController {
        let homeViewController = homeCoordinator.configureMainController()
        homeCoordinator.parentCoordinator = self
        homeViewController.tabBarItem = UITabBarItem(title: "home", image: UIImage(), selectedImage: nil)

        
        let searchViewController = ordersCoordinator.configureMainController()
        ordersCoordinator.parentCoordinator = self
        searchViewController.tabBarItem = UITabBarItem(title: "search", image: UIImage(), selectedImage: nil)
        
        let addViewController = addCoordinator.configureMainController()
        addCoordinator.parentCoordinator = self
        addViewController.tabBarItem = UITabBarItem(title: "add", image: UIImage(), selectedImage: nil)
        
        let profileViewContoller = profileCoordinator.configureMainController()
        profileCoordinator.parentCoordinator = self
        profileViewContoller.tabBarItem = UITabBarItem(title: "profile", image: UIImage(), selectedImage: nil)
        
        rootViewController.viewControllers = [homeViewController, searchViewController, addViewController, profileViewContoller]
        
        navigate(with: .openHomeTab)
        return rootViewController
    }

}
