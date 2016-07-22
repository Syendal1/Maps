//
//  BootcampAnnotation.swift
//  MapTrial
//
//  Created by SnehithNitin on 7/22/16.
//  Copyright © 2016 Snehith. All rights reserved.
//

import Foundation
import MapKit

class BootcampAnnotation:NSObject,MKAnnotation{
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate:CLLocationCoordinate2D) {
        self.coordinate=coordinate
    }
    
}