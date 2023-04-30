//
//  SignInCoordinator.swift
//  TestAppMVVM
//
//  Created by Владимир on 19.03.2023.
//

import Foundation
import UIKit

protocol SignInFlow: AnyObject {
    func coordinateToTabBar()
    func coordinateToLogin()
}

class SignInCoordinator: Coordinator, SignInFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SignInViewModel()
        let signInViewController = SignInViewController(viewModel: viewModel)
        signInViewController.coordinator = self
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
    
    func coordinateToLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        coordinate(to: loginCoordinator)
    }
}
