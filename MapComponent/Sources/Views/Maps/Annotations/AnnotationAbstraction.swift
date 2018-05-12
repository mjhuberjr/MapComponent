//
//  AnnotationAbstraction.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import MapKit

class AnnotationAbstraction: NSObject, AnnotationType { // Subclass of NSObject to conform to NSObjectProtocol
    
    var id: String
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    var data: MapDataObject // This is used for AnnotationViewAbstraction
    
    init(data: MapDataObject) {
        id = data.id
        title = data.title
        subtitle = data.subtitle
        coordinate = data.coordinate
        
        self.data = data
    }
    
}
