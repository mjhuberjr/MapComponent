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
    
    var mapData: MapDataObject { get }
    
    func formatAnnotationTitle() -> String?
    func formatAnnotationTitleSelected() -> String?
    
}

extension MapDataFormattable {
    
    func formatAnnotationTitle() -> String? { return mapData.title }
    func formatAnnotationTitleSelected() -> String? { return mapData.title }
    
}
