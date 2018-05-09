//
//  MapEvent.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

protocol MapEvents: class {
    
    var annotationSelected: MapEventClosure? { get }
    
}
