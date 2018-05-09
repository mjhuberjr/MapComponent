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
    var dataFormatter: MapDataFormattable { get }
    var mapConfiguration: MapConfigurable { get }
    
}

class MapComponentPresenter: MapComponentPresentation {
    
    var dataSource: MapDataSource
    var dataFormatter: MapDataFormattable
    var mapConfiguration: MapConfigurable
    
    init(dataSource: MapDataSource, dataFormatter: MapDataFormattable, mapConfiguration: MapConfigurable) {
        self.dataSource = dataSource
        self.dataFormatter = dataFormatter
        self.mapConfiguration = mapConfiguration
    }
    
}
