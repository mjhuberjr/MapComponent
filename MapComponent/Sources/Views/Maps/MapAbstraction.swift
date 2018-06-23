//
//  MapAbstraction.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapAbstraction: UIView {
    
    var mapView: MapViewAbstraction!
    var presenter: MapComponentPresentation!
    var delegate: MapTypeDelegate! // Need to hang on to the delegate, just passing it along from the MapRootViewController gets cleaned up by ARC
    
    var mapConfiguration: MapConfigurable!
    
    // Map Events
    var annotationSelected: MapEventClosure?

    func configure(_ presenter: MapComponentPresentation, delegate: MapTypeDelegate) {
        self.presenter = presenter
        self.delegate = delegate
        
        mapConfiguration = presenter.mapConfiguration
        
        let mapAttributes = mapConfiguration.mapAttributes
        mapView = MapViewAbstraction(mapAttributes: mapAttributes, delegate: self.delegate)
        setup(mapView)
        addAnnotations()
    }
    
    func center(_ coordinate: CLLocationCoordinate2D) {
        mapView.setCenter(coordinate, withZoomLevel: 10, animated: true)
        let displayCoordinate = offset(coordinate)
        mapView.setCenter(displayCoordinate, withZoomLevel: 10, animated: true)
    }
    
}

// MARK: - Private methods

private extension MapAbstraction {
    
    func setup(_ view: UIView) {
        addSubview(mapView)
        addConstraints(view)
    }
    
    func addConstraints(_ view: UIView) {
        view.frame = self.frame
    }
    
    func addAnnotations() {
        var annotations: [AnnotationAbstraction] = []
        let dataObjects = presenter.dataSource.mapDataObjects
        for dataObject in dataObjects {
            let annotation = AnnotationAbstraction(data: dataObject)
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
    }
    
    func offset(_ coordinate: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let offsetY = mapConfiguration.offset.y
        guard offsetY != 0 else { return coordinate }
        let centerY = mapView.frame.midY
        let distanceFromCenter = centerY - offsetY
        let percentToOffsetY = Double(distanceFromCenter / mapView.frame.height)
        var center = coordinate
        center.latitude -= self.mapView.region.span.latitudeDelta * percentToOffsetY // 0.5 is the top of the screen, because the coordinate is at the center of the screen
        return center
    }
    
}

extension MapAbstraction: MapEvents { }
