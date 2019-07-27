//
//  CharacterData.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import SwiftyJSON

protocol CharacterDataProtocol: class {
    var available: Int { get }
    var items: [CharacterDataItem]? { get }
}

class CharacterData: CharacterDataProtocol {
    var available: Int = 0
    var items: [CharacterDataItem]?
    
    convenience init(_ json: JSON) {
        self.init()
        if let available = json["available"].int {
            self.available = available
        }
        if let items = json["items"].array {
            self.items = items.map { CharacterDataItem($0) }
        }
    }
}
