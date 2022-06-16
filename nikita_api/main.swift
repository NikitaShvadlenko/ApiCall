//
//  main.swift
//  nikita_api
//
//  Created by Vladislav Lisianskii on 15.06.2022.
//

import Foundation
import Moya

let provider = MoyaProvider<CoinsbitRoute>()

let nonce = String(Date().timeIntervalSince1970)

let requestBody = MarketRequestBody(requestPath: "/api/v1/order/new_market", market: .busdUSDT, direction: .buy, amount: "20", nonce: nonce)

provider.request(.marketSell(requestBody: requestBody)) { result in
    print(result)
    exit(0)
}

RunLoop.main.run()
