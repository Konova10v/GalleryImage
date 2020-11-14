//
//  GalleryImageVM.swift
//  GalleryImage
//
//  Created by Кирилл Коновалов on 14.11.2020.
//

import Foundation
import SwiftUI

class GalleryImageViewModel: ObservableObject {
    var tempMoscow: [GalleryImage] = [GalleryImage]()
    
    func fetchWeatherMoscow() {
        GalleryImageService().getGalleryImage { (result) in
            self.tempMoscow = result
        }
    }
}
