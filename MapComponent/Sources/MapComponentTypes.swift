//
//  MapComponentTypes.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/4/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public typealias MapEventClosure = (String) -> Void // String refers to the id of the datasource

public protocol MapInteractions: class {
    
    func zoomIn()
    func zoomOut()
    func recenter()
    func selectAnnotation()
    
}

protocol MapEvents: class {
    
    var annotationSelected: MapEventClosure? { get }
    
}
