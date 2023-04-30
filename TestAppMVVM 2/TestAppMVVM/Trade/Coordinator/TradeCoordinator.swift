//
//  TradeCoordinator.swift
//  TestAppMVVM
//
//  Created by Владимир on 19.03.2023.
//

import UIKit

protocol TradeFlow: AnyObject {

}

class TradeCoordinator: Coordinator, TradeFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let networkLayer = NetworkLayer()
        let viewModel = TradeViewModel(networkLayer: networkLayer)
        let tradeViewController = TradeViewController(viewModel: viewModel)
        tradeViewController.coordinator = self
        navigationController?.pushViewController(tradeViewController, animated: false)
    }
}
