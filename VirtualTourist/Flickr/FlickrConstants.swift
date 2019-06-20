//
//  FlickrConstants.swift
//  VirtualTourist
//
//  Created by Sarah Rebecca Estrellado on 5/28/19.
//  Copyright © 2019 Sarah Rebecca Estrellado. All rights reserved.
//

import Foundation


extension FlickrClient {
    
    struct FlickrConstants {
        
        struct API {
            static let APIKey = "6cc71bb22216ebce5f3269ae75ea9ea0"
            static let APIScheme = "https"
            static let APIHost = "api.flickr.com"
            static let APIPath = "/services/rest/"
        }
        
        struct ParameterKeys {
            static let APIKey = "api_key"
            static let Method = "method"
            static let Latitude = "lat"
            static let Longitude = "lon"
            static let Page = "page"
            static let PerPage = "per_page"
            static let Format = "format"
            static let NoJsonCallback = "nojsoncallback"
        }
        
        struct ParameterValues {
            static let PhotosSearch = "flickr.photos.search"
            static let Json = "json"
            static let NoJsonCallback = 1
            static let PerPage = 21
        }
    }
    
}
