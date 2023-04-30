//
//  Constants.swift
//  TestAppMVVM
//
//  Created by Владимир on 17.03.2023.
//

import Foundation

enum Constants {
    enum Network {
        static let baseURL = URL(string: "https://run.mocky.io")!
    }
    
    enum TradeIdentifiers {
        static let categories = "categories"
        static let latests = "latests"
        static let flashSales = "flashSales"
        static let brands = "brands"
    }
    
    enum CollectionViewIdentifiers {
        static let category = "category"
        static let latest = "latest"
        static let flashSale = "flashSale"
        static let brand = "brand"
    }
}


