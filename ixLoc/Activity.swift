//
//  Activity.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/04.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import Foundation

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
    
}
