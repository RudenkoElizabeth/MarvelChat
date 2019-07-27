//
//  ChatModelTests.swift
//  MarvelChatTests
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import XCTest
@testable import MarvelChat

class ChatModelTests: XCTestCase {
    let message = Message(text: "Hello", type: MessageType.sent)
    
    
    func testMesssage() {
        XCTAssertEqual(message.text, "Hello")
        XCTAssertEqual(message.type, MessageType.sent)
    }
    
    func testChat() {
        let chat = Chat()
        chat.characterId = 123
        chat.messages.append(message)
        XCTAssertEqual(chat.characterId, 123)
        XCTAssertEqual(chat.messages.count, 1)
    }
}
