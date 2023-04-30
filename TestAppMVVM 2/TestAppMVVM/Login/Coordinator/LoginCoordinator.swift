//
//  LoginCoordinator.swift
//  TestAppMVVM
//
//  Created by Владимир on 21.03.2023.
//

import Foundation
import UIKit

protocol LoginFlow: AnyObject {
    func coordinateToTabBar()
}

class LoginCoordinator: Coordinator, LoginFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let viewModel = LoginViewModel()
        let loginViewController = LoginViewController(viewModel: viewModel)
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func coordinateToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
    
}
