//
//  MarvelChatTests.swift
//  MarvelChatTests
//
//  Created by Elizabeth Rudenko on 25/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import MarvelChat

extension XCTestCase {
    func getJSON(resourse: String) -> JSON? {
        var json: JSON?
        
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: resourse, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                json = try JSON(data: data)
                return json
            } catch {
                XCTFail()
            }
        }
        XCTAssert(json != nil)
        return nil
    }
}

