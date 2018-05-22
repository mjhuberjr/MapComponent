//
//  MapInteraction.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/8/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation
import CoreLocation

protocol MapInteraction: class {

    func recenter()
    func focus(on coordinate: CLLocationCoordinate2D?)
    func selectAnnotation(with identifier: String)
    func deselectAnnotation()
    
}

class MapInteractor {
    
    var presenter: MapComponentPresentation
    var mapView: MapAbstraction
    
    init(presenter: MapComponentPresentation, mapView: MapAbstraction) {
        self.presenter = presenter
        self.mapView = mapView
    }
    
}

extension MapInteractor: MapInteraction {
    
    func recenter() {
        // TODO: Use current location, for now use SLC
        let coordinate  = CLLocationCoordinate2D(latitude: 40.5649781, longitude: -111.83897260000003)
        mapView.center(coordinate)
    }
    
    func focus(on coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else { recenter(); return }
        mapView.center(coordinate)
    }
    
    func selectAnnotation(with identifier: String) {
        let data = presenter.dataSource.data
        let object = data.filter {
            $0.id == identifier
        }.first
        guard let selectedObject = object else { fatalError("That object doesn't exist therefore should not be selectable.") }
        presenter.selectedObject = selectedObject
        let coordinate = selectedObject.coordinate
        focus(on: coordinate)
    }
    
    func deselectAnnotation() {
        presenter.selectedObject = nil
        recenter()
    }
    
}
