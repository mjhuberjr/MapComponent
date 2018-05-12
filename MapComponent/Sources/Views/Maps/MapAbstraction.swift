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
        mapView = MapViewAbstraction(mapAttributes: mapAttributes, delegate: delegate)
        setup(mapView)
        addAnnotations()
    }
    
    func center(_ coordinate: CLLocationCoordinate2D) {
        mapView.setCenter(coordinate, animated: true)
    }
    
}

// MARK: - Private methods

private extension MapAbstraction {
    
    func setup(_ view: UIView) {
        addSubview(mapView)
        addConstraints(view)
    }
    
    func addConstraints(_ view: UIView) {
        view.pinToEdges(of: self)
    }
    
    func addAnnotations() {
        var annotations: [AnnotationAbstraction] = []
        let dataObjects = presenter.dataSource.data
        for dataObject in dataObjects {
            let annotation = AnnotationAbstraction(data: dataObject)
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
    }
    
}

extension MapAbstraction: MapEvents { }
