//
//  Character.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 26/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import SwiftyJSON

protocol CharacterProtocol: class {
    var id: Int { get }
    var name: String? { get }
    var description: String? { get }
    var thumbnail: ThumbnailProtocol? { get }
    var comics: CharacterData? { get }
    var series: CharacterData? { get }
    var stories: CharacterData? { get }
    var events: CharacterData? { get }
}

class Character: CharacterProtocol {
    var id: Int = 0
    var name: String?
    var description: String?
    var thumbnail: ThumbnailProtocol?
    var comics: CharacterData?
    var series: CharacterData?
    var stories: CharacterData?
    var events: CharacterData?
    
    convenience init(_ json: JSON) {
        self.init()
        if let id = json["id"].int {
            self.id = id
        }
        name = json["name"].string
        description = json["description"].string 
        thumbnail = Thumbnail(json["thumbnail"])
        comics = CharacterData(json["comics"])
        series = CharacterData(json["series"])
        stories = CharacterData(json["stories"])
        events = CharacterData(json["events"])
    }
}
