//
//  ClientConfig.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 25/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import Foundation

struct ClientConfig {
    static let apiScheme = "https://"
    static let apiHost = "gateway.marvel.com"
    static let apiPath = "/v1/public/characters"
    static let publicKey = "d348c2f05fda572345c27bafe1b66bfc"
    static let privateKey = "f1749b3f6d34bac2e0105f40de970ea11c3b4773"
    enum ParameterKey: String {
        case apikey = "apikey"
        case hash = "hash"
        case timeStamp = "ts"
        case limit = "limit"
        case offset = "offset"
    }
}
