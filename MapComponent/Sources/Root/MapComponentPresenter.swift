//
//  MapComponentPresenter.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/4/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import CoreLocation

protocol MapComponentPresentation: class {
    
    var dataSource: MapDataSource { get }
    var dataFormatter: MapDataFormattable { get }
    var mapConfiguration: MapConfigurable { get }
    
    var selectedObject: MapDataObject? { get set }
    var centerLocation: CLLocationCoordinate2D { get }
    
}

class MapComponentPresenter: MapComponentPresentation {
    
    var dataSource: MapDataSource
    var dataFormatter: MapDataFormattable
    var mapConfiguration: MapConfigurable
    
    var selectedObject: MapDataObject?
    
    var centerLocation: CLLocationCoordinate2D {
        return dataSource.centerLocation
    }
    
    init(dataSource: MapDataSource, dataFormatter: MapDataFormattable, mapConfiguration: MapConfigurable) {
        self.dataSource = dataSource
        self.dataFormatter = dataFormatter
        self.mapConfiguration = mapConfiguration
        
        Themeable.shared.mapThemeable = mapConfiguration.themeable
    }
    
}
