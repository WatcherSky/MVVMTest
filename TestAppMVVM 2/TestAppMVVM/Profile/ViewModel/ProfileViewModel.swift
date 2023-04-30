//
//  ProfileViewModel.swift
//  TestAppMVVM
//
//  Created by Владимир on 23.03.2023.
//

import Foundation
import UIKit

class ProfileViewModel {
    





var sections: [SectionModel] = [
    SectionModel(title: "Trade store", image: UIImage.init(named: "wallet_image")),
    SectionModel(title: "Payment method", image: UIImage.init(named: "wallet_image")),
    SectionModel(title: "Balance", image: UIImage.init(named: "wallet_image")),
    SectionModel(title: "Trade history", image: UIImage.init(named: "wallet_image")),
    SectionModel(title: "Restore Purchase", image: UIImage.init(named: "refresh_image")),
    SectionModel(title: "Help", image: UIImage.init(named: "help_image")),
    SectionModel(title: "Logout", image: UIImage.init(named: "logout_image"))
]


}
