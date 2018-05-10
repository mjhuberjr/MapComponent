//
//  MapDataSource.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation
import CoreLocation

// The app that uses the MapComponent will need a translator that returns a MapDataSource object to pass to the coordinator
// MapDataSource is just an array of MapDataObjects. The translator should convert the array of whatever object the app uses convert
// them to MapDataObjects then bundle them back up as a MapDataSource.

public protocol MapDataSource {
    var data: [MapDataObject] { get }
}

public protocol MapDataObject {
    
    var id: String { get }
    var title: String { get }
    var coordinate: CLLocationCoordinate2D { get }
    
}

class PrototypeData: MapDataSource {
    
    var data: [MapDataObject]
    
    struct PrototypeObject: MapDataObject {
        var id: String
        var title: String
        var coordinate: CLLocationCoordinate2D
    }
    
    init() {
        let object1 = PrototypeObject(id: "1", title: "4300", coordinate: CLLocationCoordinate2D(latitude: 40.7607793, longitude: -111.89104739999999))
        let object2 = PrototypeObject(id: "2", title: "2700", coordinate: CLLocationCoordinate2D(latitude: 40.2968979, longitude: -111.69464749999997))
        let object3 = PrototypeObject(id: "3", title: "3500", coordinate: CLLocationCoordinate2D(latitude: 40.3916172, longitude: -111.85076620000001))
        let object4 = PrototypeObject(id: "4", title: "3700", coordinate: CLLocationCoordinate2D(latitude: 40.3768954, longitude: -111.79576450000002))
        data = [object1, object2, object3, object4]
    }
    
}
