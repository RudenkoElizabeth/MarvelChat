//
//  Characters.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import SwiftyJSON

class Characters {
    
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [CharacterProtocol]?
    
    convenience init(_ json: JSON) {
        self.init()
        offset = json["data"]["offset"].int
        limit = json["data"]["limit"].int
        total = json["data"]["total"].int
        count = json["data"]["count"].int
        if let results = json["data"]["results"].array {
            self.results = results.map { Character($0) }
        }
    }
}
