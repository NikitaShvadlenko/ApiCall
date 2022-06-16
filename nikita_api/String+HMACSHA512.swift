//
//  String+HMACSHA512.swift
//  nikita_api
//
//  Created by Vladislav Lisianskii on 15.06.2022.
//

import Foundation
import CommonCrypto

extension String {
    func sha512hmac(key: String) -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA512), key, key.count, self, self.count, &digest)
        let data = Data(digest)
        return data.hexEncodedString()
    }
}
