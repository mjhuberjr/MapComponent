//
//  MapAbstraction.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit
import CoreLocation

class MapAbstraction: UIView {
    
    var mapView: MapViewAbstraction!
    var presenter: MapComponentPresentation!
    
    // Map Events
    var annotationSelected: MapEventClosure?

    func configure(_ presenter: MapComponentPresentation, delegate: MapAbstractionDelegate) {
        self.presenter = presenter
        
        let mapAttributes = presenter.mapConfiguration.mapAttributes
        self.mapView = MapViewAbstraction(mapAttributes: mapAttributes, delegate: delegate)
    }
    
    func center(_ coordinate: CLLocationCoordinate2D) {
        mapView.setCenter(coordinate, animated: true)
    }
    
}

extension MapAbstraction: MapEvents { }
