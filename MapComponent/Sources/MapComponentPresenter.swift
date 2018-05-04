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
    
}

class MapComponentPresenter: MapComponentPresentation {
    
    var dataSource: MapDataSource
    
    init(dataSource: MapDataSource) {
        self.dataSource = dataSource
    }
    
}
