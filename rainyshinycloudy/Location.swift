//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Shehryar Khan on 07.09.17.
//  Copyright © 2017 Shehryar Khan. All rights reserved.
//

import CoreLocation

class Location {

    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!


}
