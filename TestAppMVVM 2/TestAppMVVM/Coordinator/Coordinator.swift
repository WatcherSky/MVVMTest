//
//  Coordinator.swift
//  TestAppMVVM
//
//  Created by Владимир on 19.03.2023.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
