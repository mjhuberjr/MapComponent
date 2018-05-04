//
//  MapComponentTypes.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/4/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public typealias MapEventClosure = (String) -> Void // String refers to the id of the datasource

public protocol MapInteractions: class {
    
    func zoomIn()
    func zoomOut()
    func recenter()
    func selectAnnotation()
    
}

protocol MapEvents: class {
    
    var annotationSelected: MapEventClosure? { get }
    
}

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

// MapDataFormatter allows the App using the component to format the data in a way that suites their needs.

public protocol MapDataFormatter {
    
    func formatTitle(for object: MapDataObject) -> String
    func formatTitleSelected(for object: MapDataObject) -> String
    func calculateOffset() -> CGPoint
    
}

extension MapDataFormatter {
    
    func formatTitle(for object: MapDataObject) -> String { return object.title }
    func formatTitleSelected(for object: MapDataObject) -> String { return object.title }
    func calculateOffset() -> CGPoint { return CGPoint.zero }
    
}
