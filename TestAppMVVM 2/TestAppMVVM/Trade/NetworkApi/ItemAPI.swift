//
//  ItemAPI.swift
//  TestAppMVVM
//
//  Created by Владимир on 17.03.2023.
//

import Foundation
import Moya

enum ItemAPI {
    case latest
    case flashSale
}

extension ItemAPI: TargetType {
    var baseURL: URL {
        return Constants.Network.baseURL
    }
    var path: String {
        switch self {
        case .latest:
            return "/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        case .flashSale:
            return "/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    var task: Task {
        switch self{
        case .latest, .flashSale:
            return .requestPlain
        }
    }
    var sampleData: Data {
        return Data()
    }
    var headers: [String: String]? {
        return [:]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .latest, .flashSale:
            return [:]
        }
    }
}

