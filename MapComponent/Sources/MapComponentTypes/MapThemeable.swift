//
//  MapThemeable.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 6/22/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit

class Themeable {
    
    static let shared = Themeable()
    
    var mapThemeable: MapThemeable? = nil
    
    var primaryColor: UIColor { return mapThemeable!.primaryColor }
    var activeColor: UIColor { return mapThemeable!.activeColor }
    var primaryTextColor: UIColor { return mapThemeable!.primaryTextColor }
    
}

public struct MapThemeable {
    
    var primaryColor: UIColor
    var activeColor: UIColor
    var primaryTextColor: UIColor
    
    public init(primaryColor: UIColor = .darkGray,
                activeColor: UIColor = .black,
                primaryTextColor: UIColor = .white) {
        self.primaryColor = primaryColor
        self.activeColor = activeColor
        self.primaryTextColor = primaryTextColor
    }
    
}
