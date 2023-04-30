//
//  TabBarController.swift
//  TestAppMVVM
//
//  Created by Владимир on 19.03.2023.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barTintColor = .white
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.itemPositioning = .centered
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
    
        barSetup()
    }
    
    
    func barSetup() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .light)
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    var coordinator: TabBarCoordinator?
}
