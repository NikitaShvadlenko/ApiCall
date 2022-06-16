//
//  MarketRequestBody.swift
//  nikita_api
//
//  Created by Nikita Shvad on 16.06.2022.
//

import Foundation

struct MarketRequestBody: Codable {
    let requestPath: String
    let market: Market
    let direction: Direction
    let amount: String
    let nonce: String
}

extension MarketRequestBody {
    enum CodingKeys: String, CodingKey {
        case requestPath = "request"
        case direction
        case market
        case amount
        case nonce

    }
}
