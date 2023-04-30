//
//  NetworkLayer.swift
//  TestAppMVVM
//
//  Created by Владимир on 17.03.2023.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<ItemAPI> { get }
    
    func fetchLatestProduct(completion: @escaping (Result<LatestData, Error>) -> ())
    func fetchFlashSaleProduct(completion: @escaping (Result<FlashSaleData, Error>) -> ())
}

class NetworkLayer: Networkable {
    var provider = MoyaProvider<ItemAPI>(plugins: [NetworkLoggerPlugin()])
    func fetchLatestProduct(completion: @escaping (Result<LatestData, Error>) -> ()) {
        request(target: .latest, completion: completion)
    }
    
    func fetchFlashSaleProduct(completion: @escaping (Result<FlashSaleData, Error>) -> ()) {
        request(target: .flashSale, completion: completion)
    }
}

private extension NetworkLayer {
    private func request<T: Decodable>(target: ItemAPI, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
