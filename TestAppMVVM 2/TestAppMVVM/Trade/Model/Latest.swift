//
//  Item.swift
//  TestAppMVVM
//
//  Created by Владимир on 17.03.2023.
//

import Foundation

struct Latest: Codable {
    var category: String
    var name: String
    var price: Int
    var image_url: URL
}

struct LatestData: Codable {
    let latest: [Latest]
}
