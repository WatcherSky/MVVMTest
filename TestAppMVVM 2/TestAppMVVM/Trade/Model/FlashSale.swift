//
//  FlashSale.swift
//  TestAppMVVM
//
//  Created by Владимир on 23.03.2023.
//

import Foundation


struct FlashSale: Codable {
    var category: String
    var name: String
    var price: Double
    var discount: Int
    var image_url: URL
}

struct FlashSaleData: Codable {
    let flash_sale: [FlashSale]
}
