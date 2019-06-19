//
//  CollectionViewState.swift
//  VirtualTourist
//
//  Created by Sarah Rebecca Estrellado on 6/9/19.
//  Copyright © 2019 Sarah Rebecca Estrellado. All rights reserved.
//

import Foundation

enum CollectionViewState {
    case loading
    case populated([FlickrPhoto])
    case empty
    case error(NSError)
}
