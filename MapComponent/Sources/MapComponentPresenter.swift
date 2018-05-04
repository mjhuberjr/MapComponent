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
    var dataFormatter: MapDataFormatter { get }
    
}

class MapComponentPresenter: MapComponentPresentation {
    
    var dataSource: MapDataSource
    var dataFormatter: MapDataFormatter
    
    init(dataSource: MapDataSource, dataFormatter: MapDataFormatter) {
        self.dataSource = dataSource
        self.dataFormatter = dataFormatter
    }
    
}
