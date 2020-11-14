//
//  ImageModel.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 14.11.2020.
//

import Foundation
import ObjectMapper

struct GalleryImage {
    var id: String = ""
    var author: String = ""
    var width: Int = 0
    var height: Int = 0
    var url: String = ""
    var downloadUrl: String = ""
    
    init(id: String, author: String, width: Int, height: Int, url: String, downloadUrl: String) {
        self.id = id
        self.author = author
        self.width = width
        self.height = height
        self.url = url
        self.downloadUrl = downloadUrl
    }
    
    static func getDefault() -> GalleryImage {
        return GalleryImage(id: "1", author: "Test Test", width: 123, height: 123, url: "https://unsplash.com/photos/yC-Yzbqy7PY", downloadUrl: "https://picsum.photos/id/0/5616/3744")
    }
}

// MARK: - Mapper
class GalleryImageMapper: Mappable {
    var id: String?
    var author: String?
    var width: Int?
    var height: Int?
    var url: String?
    var downloadUrl: String?

    required init?(map: Map) {
        // ...
    }

    func mapping(map: Map) {
        self.id <- map["id"]
        self.author <- map["author"]
        self.width <- map["width"]
        self.height <- map["height"]
        self.url <- map["url"]
        self.downloadUrl <- map["download_url"]
    }
}

