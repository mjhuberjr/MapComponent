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
        guard let identifier = presenter.dataSource.mapDataObjects.first?.id else { return }
        selectAnnotation(with: identifier)
    }
    
    func focus(on coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else { recenter(); return }
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
        let annotationView = mapAbstraction.mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        annotationView?.setSelected(true, animated: true)
    }
    
    func deselectAnnotation() {
        presenter.selectedObject = nil
        recenter()
    }
    
}
