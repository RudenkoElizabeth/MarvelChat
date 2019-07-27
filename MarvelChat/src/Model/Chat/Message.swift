//
//  Message.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import RealmSwift

class Message: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var type: MessageType = .received
    @objc dynamic var createdAt: Date = Date()
    @objc dynamic var text: String? = nil
    
    convenience init(text: String, type: MessageType) {
        self.init()
        self.type = type
        self.text = text
    }
}

@objc enum MessageType: Int {
    case received
    case sent
}
