//
//  MessageService.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import RealmSwift

class MessageService {
    public func sendMessage(characterId: Int, message: Message) -> () {
        try? uiRealm.write {
            if let chatFromDb = getChat(characterId: characterId) {
                chatFromDb.messages.append(message)
                uiRealm.add(chatFromDb, update: .all)
            } else {
                let chat = Chat()
                chat.characterId = characterId
                chat.messages.append(message)
                uiRealm.add(chat, update: .all)
            }
        }
    }
    
    public func getMessages(characterId: Int) -> [Message] {
        guard let chat = getChat(characterId: characterId) else { return [] }
        return Array(chat.messages.sorted(byKeyPath: "createdAt"))
    }
    
    private func getChat(characterId: Int) -> Chat? {
        return uiRealm.objects(Chat.self).filter("characterId = \(characterId)").first
    }
}
