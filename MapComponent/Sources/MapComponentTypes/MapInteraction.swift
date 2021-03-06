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
    
    func focus(on coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else { return }
        mapView.center(coordinate)
    }
    
    func selectAnnotation(with identifier: String) {
        let data = presenter.dataSource.mapDataObjects
        let object = data.filter {
            $0.id == identifier
        }.first
        guard let selectedObject = object else { fatalError("That object doesn't exist therefore should not be selectable.") }
        presenter.selectedObject = selectedObject
        let coordinate = selectedObject.coordinate
        
        selectAnnotationView(from: mapView, with: identifier)
        
        focus(on: coordinate)
    }
    
    func selectAnnotationView(from mapAbstraction: MapAbstraction, with identifier: String) {
        let annotation = mapView.mapView.annotations.filter { annotation in
            guard let annotationAbstraction = annotation as? AnnotationAbstraction else { return false }
            return annotationAbstraction.id == identifier
        }.first!
        mapAbstraction.mapView.selectAnnotation(annotation, animated: true)
    }
    
    func deselectAnnotation() {
        presenter.selectedObject = nil
    }
    
}
