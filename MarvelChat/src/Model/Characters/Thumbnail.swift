//
//  thumbnail.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 26/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import SwiftyJSON

protocol ThumbnailProtocol: class {
    var path: String? { get }
    var imageExtension: String? { get }
}

class Thumbnail: ThumbnailProtocol {
    var path: String?
    var imageExtension: String?
    
    convenience init(_ json: JSON) {
        self.init()
        path = json["path"].string
        imageExtension = json["extension"].string
    }
}
