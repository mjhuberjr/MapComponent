//
//  AnnotationAbstraction.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import MapKit

class AnnotationAbstraction: NSObject, AnnotationType { // Subclass of NSObject to conform to NSObjectProtocol
    
    var data: MapDataObject
    var coordinate: CLLocationCoordinate2D
    
    init(data: MapDataObject, coordinate: CLLocationCoordinate2D) {
        self.data = data
        self.coordinate = coordinate
    }
    
}
