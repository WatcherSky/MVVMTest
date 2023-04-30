//
//  TradeViewModel.swift
//  TestAppMVVM
//
//  Created by Владимир on 20.03.2023.
//

import Foundation

class TradeViewModel {
    var networkLayer: NetworkLayer
    
    var latest: Observable<[Latest]> = Observable([])
    var flashSale: Observable<[FlashSale]> = Observable([])
    
    
    let sectionsTrade: [SectionTradeType] = [.categories, .latest, .flashSale, .brands]
    
    init(networkLayer: NetworkLayer) {
        self.networkLayer = networkLayer
    }
}

extension TradeViewModel {
    func fetchProducts(success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        networkLayer.fetchLatestProduct(completion: { [weak self] results in
            switch results {
            case .success(let itemData):
                self?.latest = Observable(itemData.latest)
                success()
            case .failure(let error):
                failure(error)
            }
        }
        )}
    
    
    func fetchFlashSaleProducts(success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        networkLayer.fetchFlashSaleProduct(completion: { [weak self] results in
            switch results {
            case .success(let itemData):
                self?.flashSale = Observable(itemData.flash_sale)
                success()
            case .failure(let error):
                failure(error)
            }
        }
        )}
}
