//
//  CharacterModelTests.swift
//  MarvelChatTests
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import XCTest
@testable import MarvelChat

class CharacterModelTests: XCTestCase {
    
    func testThumbnail() {
        let json = getJSON(resourse: "Thumbnail")
        let thunbnail = Thumbnail(json!)
        XCTAssertEqual(thunbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784")
        XCTAssertEqual(thunbnail.imageExtension, "jpg")
    }
    
    func testCharacterDataItem() {
        let json = getJSON(resourse: "CharacterDataItem")
        let characterDataItem = CharacterDataItem(json!)
        XCTAssertEqual(characterDataItem.name, "Avengers: The Initiative (2007) #14")
    }
    
    func testCharacterData() {
        let json = getJSON(resourse: "CharacterData")
        let characterData = CharacterData(json!)
        XCTAssertEqual(characterData.available, 3)
        XCTAssertEqual(characterData.items?.count, 3)
    }
    
    func testCharacter() {
        let json = getJSON(resourse: "Character")
        let character = Character(json!)
        XCTAssertEqual(character.id, 1011334)
        XCTAssertEqual(character.name, "3-D Man")
        XCTAssertEqual(character.description, "Some description")
        XCTAssertNotNil(character.thumbnail)
        XCTAssertNotNil(character.series)
        XCTAssertNotNil(character.comics)
        XCTAssertNotNil(character.stories)
    }
    
    func testCharacters() {
        let json = getJSON(resourse: "Characters")
        let characters = Characters(json!)
        XCTAssertEqual(characters.count, 20)
        XCTAssertEqual(characters.limit, 20)
        XCTAssertEqual(characters.offset, 0)
        XCTAssertEqual(characters.total, 1492)
        XCTAssertNotNil(characters.results)
    }
}
