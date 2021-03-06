//
//  MapAttributes.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public struct MapAttributes {
    
    let isZoomEnabled: Bool
    let isScrollEnabled: Bool
    let isPitchEnabled: Bool
    let isRotateEnabled: Bool
    
    public init(isZoomEnabled: Bool = true,
         isScrollEnabled: Bool = true,
         isPitchEnabled: Bool = false,
         isRotateEnabled: Bool = false) {
        self.isZoomEnabled = isZoomEnabled
        self.isScrollEnabled = isScrollEnabled
        self.isPitchEnabled = isPitchEnabled
        self.isRotateEnabled = isRotateEnabled
    }
    
}
