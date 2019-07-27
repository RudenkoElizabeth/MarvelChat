//
//  CharacterDataItem.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import SwiftyJSON

protocol CharacterDataItemProtocol: class {
    var name: String? { get }
}

class CharacterDataItem: CharacterDataItemProtocol {
    var name: String?
    
    convenience init(_ json: JSON) {
        self.init()
        name = json["name"].string
    }
}
