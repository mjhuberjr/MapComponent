//
//  MapComponentPresenter.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/4/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

protocol MapComponentPresentation: class {
    
    var dataSource: MapDataSource { get }
    var mapConfiguration: MapConfigurable { get }
    
    var selectedObject: MapDataObject? { get set }
    
}

class MapComponentPresenter: MapComponentPresentation {
    
    var dataSource: MapDataSource
    var mapConfiguration: MapConfigurable
    
    var selectedObject: MapDataObject?
    
    init(dataSource: MapDataSource, mapConfiguration: MapConfigurable) {
        self.dataSource = dataSource
        self.mapConfiguration = mapConfiguration
        
        Themeable.shared.mapThemeable = mapConfiguration.themeable
    }
    
}
