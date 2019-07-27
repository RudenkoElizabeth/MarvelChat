//
//  CharacterSetviceTest.swift
//  MarvelChatTests
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import XCTest
@testable import MarvelChat

class CharacterServiceTest: XCTestCase {
    let characterService = CharacterService()

    func testService() {
        characterService.getCharactersFor(page: 0, 
                                          completionHandler: { chracters in
                                            XCTAssertEqual(chracters.count, 20)
        }, errorHandler: { error in 
            guard let error = error else {
                XCTFail()
                return
            }
            XCTFail(error)
        })
    }
}
