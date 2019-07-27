//
//  APIService.swift
//  MarvelChat
//
//  Created by Elizabeth Rudenko on 27/07/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct APIResponse {
    let statusCode: Int
    let json: JSON
}

class APIService {
    private let someError = "Internal server error"
    
    func getDataFrom(url: URL,
                     parameters: Parameters,
                     completionHandler: @escaping(APIResponse)->(), 
                     errorHandler: @escaping(String?)->()) {
        Alamofire.request(url, parameters: parameters)
            .response(responseSerializer: DataRequest.jsonResponseSerializer()) { (response) in
                // Fail
                if response.result.isFailure == true {
                    let error = response.result.error
                    errorHandler(error?.localizedDescription)
                    return
                }
                // Empty
                guard let resultValue = response.result.value else {
                    print("Response result is nil")
                    errorHandler(self.someError)
                    return
                }
                // Status code
                guard let statusCode = response.response?.statusCode,
                    let data = response.data,
                    let jsonWithObjectRoot = try? JSONSerialization.jsonObject(with: data) else {
                        print("Error parsing status code")
                        errorHandler(self.someError)
                        return
                }
                self.check(statusCode: statusCode, for: jsonWithObjectRoot, errorHandler: { error in
                    errorHandler(error)
                })
                //  APIResponse
                let json = JSON(resultValue)
                guard json != JSON.null else {
                    print("Error parsing JSON")
                    errorHandler(self.someError)
                    return
                }
                if let error = json["error"].string {
                    errorHandler(error)
                    return
                }
                completionHandler(APIResponse(statusCode: statusCode, json: json))
        }
    }
    
    private func check(statusCode: Int, 
                       for jsonWithObjectRoot: Any, 
                       errorHandler: @escaping(String?)->()) {
        guard let dictionary = jsonWithObjectRoot as? [String: Any] else { return }
        let statusMessage = dictionary["message"] as? String ?? ""
        switch statusCode {
        case 401:
            errorHandler(statusMessage)
            return
        case 404:
            errorHandler(statusMessage)
            return
        case 500:
            errorHandler(someError)
            return
        default:
            break
        }
    }
}
