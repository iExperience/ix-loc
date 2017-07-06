//
//  Activity.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/04.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import Foundation
import MapKit

class Activity {
    
    var name: String?
    var description: String?
    var latitude: Double?
    var longitude: Double?
    
    init(name: String?, description: String?) {
        self.name = name
        self.description = description
    }
    
    init(name: String?, description: String?, latitude: Double?, longitude: Double) {
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(name: String?, description: String?, location: CLLocationCoordinate2D) {
        self.name = name
        self.description = description
        self.latitude = location.latitude
        self.longitude = location.longitude
    }
    
    func getAppleLocation() -> CLLocationCoordinate2D {
        var coordinate = CLLocationCoordinate2D()
        coordinate.latitude = self.latitude!
        coordinate.longitude = self.longitude!
        return coordinate
    }
    
}
