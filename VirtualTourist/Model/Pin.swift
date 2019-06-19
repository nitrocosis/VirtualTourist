//
//  Pin.swift
//  VirtualTourist
//
//  Created by Sarah Rebecca Estrellado on 5/29/19.
//  Copyright © 2019 Sarah Rebecca Estrellado. All rights reserved.
//

import Foundation
import MapKit

extension Pin: MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
}
}
