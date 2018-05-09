//
//  MapDataFormattable.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

// MapDataFormatter allows the App using the component to format the data in a way that suites their needs.

public protocol MapDataFormattable {
    
    func formatTitle(for object: MapDataObject) -> String
    func formatTitleSelected(for object: MapDataObject) -> String
    
}

extension MapDataFormattable {
    
    func formatTitle(for object: MapDataObject) -> String { return object.title }
    func formatTitleSelected(for object: MapDataObject) -> String { return object.title }
    
}
