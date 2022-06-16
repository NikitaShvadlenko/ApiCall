//
//  OrdersRequestBody.swift
//  nikita_api
//
//  Created by Vladislav Lisianskii on 15.06.2022.
//

import Foundation

struct OrdersRequestBody: Codable {
    let requestPath: String
    let market: Market
    let nonce: String
}

extension OrdersRequestBody {
    enum CodingKeys: String, CodingKey {
        case requestPath = "request"
        case market
        case nonce
    }
}

