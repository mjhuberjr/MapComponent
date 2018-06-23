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
    var offsetY: CGFloat { get }
    var defaultZoomLevel: Int { get }
    var maxZoomLevel: Int { get }
    var mapAttributes: MapAttributes { get }
    var themeable: MapThemeable { get }
    
}

public extension MapConfigurable {
    
    var mapEvents: MapEvents { return MapEventsImpl() }
    var offsetY: CGFloat { return 0.0 }
    var defaultZoomLevel: Int { return 6 }
    var maxZoomLevel: Int { return 28 }
    var mapAttributes: MapAttributes { return MapAttributes() }
    var themeable: MapThemeable { return MapThemeable() }

}
