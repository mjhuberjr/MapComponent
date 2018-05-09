//
//  MapAbstraction.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit
import MapKit

class MapAbstraction: UIView {
    
    var mapView: MapViewAbstraction!
    var presenter: MapComponentPresentation!
    
    // Map Events
    var annotationSelected: MapEventClosure?

    func configure(_ presenter: MapComponentPresentation) {
        self.presenter = presenter
        
        let mapEvents = presenter.mapConfiguration.mapEvents
        self.annotationSelected = mapEvents.annotationSelected
    }
    
}

// MARK: - MapType Delegate

extension MapAbstraction: MapTypeDelegate {
    
    func mapView(_ mapView: MapType, viewFor annotation: AnnotationType) -> AnnotationViewType? {
        guard let annotation = annotation as? AnnotationAbstraction else { return nil }
        let data = annotation.data
        let identifier = data.id
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? AnnotationViewAbstraction
        if annotationView == nil {
            annotationView = AnnotationViewAbstraction(annotation: annotation, reuseIdentifier: identifier)
        }
        return annotationView
    }
    
    func mapView(_ mapView: MapType, didSelect view: AnnotationViewType) {
        guard let annotationView = view as? AnnotationViewAbstraction else { return }
        let identifier = annotationView.data.id
        // TODO: Center map and make AnnotationView larger with animation
        annotationSelected?(identifier)
    }
    
}

extension MapAbstraction: MapEvents { }
