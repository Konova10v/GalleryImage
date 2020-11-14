//
//  APICallManager.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 14.11.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

/// enum с перечеслинение API-endpoints
enum ServerAPI {
    static var baseURL = "https://picsum.photos/v2/list"
}

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class APICallManager {
    static let shared = APICallManager()
    
    var decoder: JSONDecoder {
        let decode = JSONDecoder()
        decode.keyDecodingStrategy = .convertFromSnakeCase
        return decode
    }

    func createRequest(
        _ url: String,
        method: HTTPMethod,
        headers: [String: String]?,
        parameters: AnyObject?,
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?
    ) {
        AF.request(url, method: method).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successCallback?(json)
            case .failure(let error):
                if let callback = failureCallback {
                    callback(error.localizedDescription)
                }
            }
        }
    }
}
