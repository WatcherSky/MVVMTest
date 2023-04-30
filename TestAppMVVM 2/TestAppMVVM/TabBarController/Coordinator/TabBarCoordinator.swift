//
//  TabBarCoordinator.swift
//  TestAppMVVM
//
//  Created by Владимир on 19.03.2023.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
        
        tabBarController.coordinator = self
        
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "house_image"), tag: 0)
        homeNavigationController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 8,left: 0,bottom: -8,right: 0)
        let homeCoordinator = TradeCoordinator(navigationController: homeNavigationController)
        
        let favouriteNavigationController = UINavigationController()
        favouriteNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "favourite_image"), tag: 1)
        favouriteNavigationController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 8,left: 0,bottom: -8,right: 0)
        let favouriteCoordinator = TradeCoordinator(navigationController: favouriteNavigationController)
        
        let basketNavigationController = UINavigationController()
        basketNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "basket_image"), tag: 2)
        basketNavigationController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 8,left: 0,bottom: -8,right: 0)
        let basketCoordinator = TradeCoordinator(navigationController: basketNavigationController)
        
        let messageNavigationController = UINavigationController()
        messageNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "message_image"), tag: 3)
        messageNavigationController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 8,left: 0,bottom: -8,right: 0)
        let messageCoordinator = TradeCoordinator(navigationController: messageNavigationController)
        
        
        
        let profileNavigationController = UINavigationController()
        let window = UIWindow()
        profileNavigationController.tabBarItem = UITabBarItem(title: nil, image: UIImage.init(named: "profile_image"), tag: 4)
        profileNavigationController.tabBarItem.imageInsets = UIEdgeInsets.init(top: 8,left: 0,bottom: -8,right: 0)
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController, window: window)
        
        tabBarController.viewControllers = [homeNavigationController,
                                            favouriteNavigationController, basketNavigationController, messageNavigationController, profileNavigationController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        
        coordinate(to: homeCoordinator)
        coordinate(to: favouriteCoordinator)
        coordinate(to: basketCoordinator)
        coordinate(to: messageCoordinator)
        coordinate(to: profileCoordinator)
    }
}
