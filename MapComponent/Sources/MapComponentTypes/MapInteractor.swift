//
//  MapInteractor.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public protocol MapInteractor: class {
    
    func zoomIn()
    func zoomOut()
    func recenter()
    func selectAnnotation()
    
}
