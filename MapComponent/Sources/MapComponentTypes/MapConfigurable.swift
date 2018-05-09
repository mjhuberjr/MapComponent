//
//  MapConfigurable.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public protocol MapConfigurable {
    
    var offset: CGPoint { get }
    var defaultZoomLevel: CGFloat { get }
    var maxZoomLevel: CGFloat { get }
    
}

extension MapConfigurable {
    
    var offset: CGPoint { return CGPoint.zero }
    var defaultZoomLevel: CGFloat { return 0.0 }
    var maxZoomLevel: CGFloat { return 0.0 }
    
}
