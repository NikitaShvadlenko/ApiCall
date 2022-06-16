import Foundation
import Moya

enum CoinsbitRoute {
    case orders(requestBody: OrdersRequestBody)
    case marketSell(requestBody: MarketRequestBody)
}

// MARK: - TargetType
extension CoinsbitRoute: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.coinsbit.io") else {
            fatalError("URL is wrong")
        }
        return url
    }

    var path: String {
        switch self {
        case .orders:
            return "/api/v1/orders"
        case .marketSell:
            return "/api/v1/order/new_market"
        }
    }

    var method: Moya.Method {
        switch self {
        case .orders, .marketSell:
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .orders(requestBody):
            return .requestJSONEncodable(requestBody)

        case let .marketSell(requestBody):
            return .requestJSONEncodable(requestBody)
        }
    }

    var headers: [String: String]? {
        switch self {
        case let .orders(requestBody):
            let jsonEncoder = JSONEncoder()
            guard let requestBodyJSON = try? jsonEncoder.encode(requestBody) else { return nil }
            let payload = requestBodyJSON.base64EncodedString()
            let signature = payload.sha512hmac(key: SecretsProvider.apiSecret)
            let dict = [
                "X-TXC-APIKEY": SecretsProvider.apiKey,
                "X-TXC-PAYLOAD": payload,
                "X-TXC-SIGNATURE": signature
            ]
            return dict

        case let .marketSell(requestBody):
            let jsonEncoder = JSONEncoder()
            guard let requestBodyJSON = try? jsonEncoder.encode(requestBody) else { return nil }
            let payload = requestBodyJSON.base64EncodedString()
            let signature = payload.sha512hmac(key: SecretsProvider.apiSecret)
            let dict = [
                "X-TXC-APIKEY": SecretsProvider.apiKey,
                "X-TXC-PAYLOAD": payload,
                "X-TXC-SIGNATURE": signature
            ]
            return dict
        }
    }


}
