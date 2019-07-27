//
//  StringHelper.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 26/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import CommonCrypto

// MARK: - MD5

extension String {
    var md5Value: String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)
        
        if let d = self.data(using: .utf8) {
            _ = d.withUnsafeBytes { body -> String in
                CC_MD5(body.baseAddress, CC_LONG(d.count), &digest)
                
                return ""
            }
        }
        
        return (0 ..< length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
}

// MARK: - Upper case

extension String {
    func getUpperCase() -> String {
        var output = String()
        self.forEach() { chr in
            let str = String(chr)
            if str.lowercased() != str {
                output += str
            }
        }
        return output
    }
}
