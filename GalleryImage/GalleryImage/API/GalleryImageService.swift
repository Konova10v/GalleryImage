//
//  GalleryImageService.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 14.11.2020.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class GalleryImageService {
    /// получить картинки    
    public func getGalleryImage(callback: @escaping (_ meters: [GalleryImage]) -> Void ) {
        
        let url = ServerAPI.baseURL
        
        APICallManager.shared.createRequest(url, method: .get, headers: nil, parameters: nil, onSuccess: { (responseObject: JSON) -> Void in
            if let cocktailList = responseObject.arrayObject as? [[String : Any]] {
                if let mapped: [GalleryImageMapper] = Mapper<GalleryImageMapper>().mapArray(JSONObject: cocktailList) {
                    let meters = GalleryImageService.self.convertMeters(meters: mapped)
                    callback(meters)
                }
            }
            
        }, onFailure: {(errorMessage: String) -> Void in
            print("error")
        })
    }
}

extension GalleryImageService {
    fileprivate class func convert(meter: GalleryImageMapper) -> GalleryImage? {
        guard let id = meter.id, let author = meter.author, let width = meter.width, let height = meter.height, let url = meter.url, let downloadUrl = meter.downloadUrl else { return nil }
        
        return GalleryImage(id: id, author: author, width: width, height: height, url: url, downloadUrl: downloadUrl)
    }
    
    fileprivate class func convertMeters(meters: [GalleryImageMapper]) -> [GalleryImage] {
        var arr = Array<GalleryImage>()
        for met in meters {
            if let meter = self.convert(meter: met) {
                arr.append(meter)
            } else {
                continue
            }
        }
        return arr
    }
}
