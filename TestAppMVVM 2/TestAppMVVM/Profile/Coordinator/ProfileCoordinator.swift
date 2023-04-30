//
//  ProfileCoordinator.swift
//  TestAppMVVM
//
//  Created by Владимир on 19.03.2023.
//

import Foundation
import UIKit


protocol ProfileFlow: AnyObject {
    func coordinateToSignIn()
}

class ProfileCoordinator: Coordinator, ProfileFlow {
    
    weak var navigationController: UINavigationController?
    let window: UIWindow
    
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self
        
        navigationController?.pushViewController(profileViewController, animated: false)
    }
    

    // MARK: - Flow Methods
    func coordinateToSignIn() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        coordinate(to: signInCoordinator)
    }
}
