//
//  MapDataSource.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

// The app that uses the MapComponent will need a translator that returns a MapDataSource object to pass to the coordinator
// MapDataSource is just an array of MapDataObjects. The translator should convert the array of whatever object the app uses convert
// them to MapDataObjects then bundle them back up as a MapDataSource.

public protocol MapDataSource {
    var dataSource: [MapDataObject] { get }
}

public protocol MapDataObject {
    
    var id: String { get }
    var title: String { get }
    
}
