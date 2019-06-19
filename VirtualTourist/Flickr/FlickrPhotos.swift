//
//  FlickrPhotos.swift
//  VirtualTourist
//
//  Created by Sarah Rebecca Estrellado on 5/28/19.
//  Copyright © 2019 Sarah Rebecca Estrellado. All rights reserved.
//

import Foundation

struct FlickrPhotos: Codable {
    let page: Int
    let pages: Int
    let photo: [FlickrPhoto]
}
