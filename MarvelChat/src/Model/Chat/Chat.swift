//
//  Chat.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import RealmSwift

class Chat: Object {
    @objc dynamic var characterId = 0
    var messages = List<Message>()
    
    override static func primaryKey() -> String? {
        return "characterId"
    }
}

