//
//  MapConfigurable.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

class MapEventsImpl: MapEvents { init() { } }

public protocol MapConfigurable {
    
    var mapEvents: MapEvents { get }
    var offset: CGPoint { get }
    var defaultZoomLevel: Double { get }
    var maxZoomLevel: Double { get }
    var mapAttributes: MapAttributes { get }
    
}

extension MapConfigurable {
    
    var mapEvents: MapEvents { return MapEventsImpl() }
    var offset: CGPoint { return CGPoint.zero }
    var defaultZoomLevel: Double { return 150000.0 }
    var maxZoomLevel: Double { return 0.0 }
    var mapAttributes: MapAttributes { return MapAttributes() }
    
}
