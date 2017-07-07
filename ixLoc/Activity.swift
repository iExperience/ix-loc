//
//  Activity.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/04.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import Foundation
import MapKit
import Gloss

class Activity: Glossy, Decodable {
    
    var name: String?
    var description: String?
    var latitude: Double?
    var longitude: Double?
    var image: UIImage?
    var imageUrl: String?
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.description = "description" <~~ json
        self.latitude = "latitude" <~~ json
        self.longitude = "longitude" <~~ json
        self.imageUrl = "imageUrl" <~~ json
    }
    
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
    
    init(dictionary: [String: AnyObject]) {
        self.name = dictionary["name"] as? String
        self.description = dictionary["description"] as? String
        self.latitude = dictionary["latitude"] as? Double
        self.longitude = dictionary["longitude"] as? Double
        self.imageUrl = dictionary["imageUrl"] as? String
    }
    
    func getAppleLocation() -> CLLocationCoordinate2D {
        var coordinate = CLLocationCoordinate2D()
        coordinate.latitude = self.latitude!
        coordinate.longitude = self.longitude!
        return coordinate
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "description" ~~> self.description,
            "latitude" ~~> self.latitude,
            "longitude" ~~> self.longitude
        ])
    }
    
}
