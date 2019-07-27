//
//  CharacterSetvice.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 26/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import Alamofire

class CharacterService: APIService {
    func getCharactersFor(page: Int, 
                          completionHandler: @escaping([CharacterProtocol])->(), 
                          errorHandler: @escaping(String?)->()) {
        getDataFrom(url: getURL(), 
                    parameters: getParametersFor(page: page), 
                    completionHandler: { response in 
                        let characters = Characters(response.json)
                        DispatchQueue.main.async {
                            completionHandler(characters.results ?? [])
                        }
        }, errorHandler: { error in 
            DispatchQueue.main.async {
                errorHandler(error)
            }
        })
    }
    
    private func getURL() -> URL {
        let baseURL = ClientConfig.apiScheme + ClientConfig.apiHost + ClientConfig.apiPath
        return URL(string: baseURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
    }
    
    private func getParametersFor(page: Int) -> Parameters {
        let limit = 20
        let offset = limit * page
        let timeStamp = Date().timeIntervalSince1970
        let hash = (String(timeStamp) + ClientConfig.privateKey + ClientConfig.publicKey).md5Value
        let keys = ClientConfig.ParameterKey.self
        let parameters: Parameters = [
            keys.timeStamp.rawValue: String(timeStamp),
            keys.apikey.rawValue: ClientConfig.publicKey,
            keys.hash.rawValue: hash,
            keys.limit.rawValue: String(limit),
            keys.offset.rawValue: String(offset)
        ]
        return parameters
    }
}


