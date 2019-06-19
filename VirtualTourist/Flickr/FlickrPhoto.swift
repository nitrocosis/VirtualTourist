//
//  FlickrPhoto.swift
//  VirtualTourist
//
//  Created by Sarah Rebecca Estrellado on 5/28/19.
//  Copyright © 2019 Sarah Rebecca Estrellado. All rights reserved.
//

import Foundation

struct FlickrPhoto: Codable {
    let id: String
    let farm: Int
    let server: String
    let secret: String
}

extension FlickrPhoto {
    func url() -> String {
        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_z.jpg"
    }
}

