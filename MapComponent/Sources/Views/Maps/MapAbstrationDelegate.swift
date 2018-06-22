//
//  MapAbstrationDelegate.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/9/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

class MapAbstractionDelegate: NSObject, MapEvents {
    
    var interactor: MapInteraction
    var annotationSelected: MapEventClosure?
    
    init(interactor: MapInteraction, mapConfiguration: MapConfigurable) {
        self.interactor = interactor
        
        let mapEvents = mapConfiguration.mapEvents
        self.annotationSelected = mapEvents.annotationSelected
    }
    
}

// MARK: - MapType Delegate

extension MapAbstractionDelegate: MapTypeDelegate {
    
    func mapView(_ mapView: MapType, viewFor annotation: AnnotationType) -> AnnotationViewType? {
        guard let annotation = annotation as? AnnotationAbstraction else { return nil }
        let identifier = annotation.id
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? AnnotationViewAbstraction
        if annotationView == nil {
            annotationView = AnnotationViewAbstraction(annotation: annotation, reuseIdentifier: identifier)
        }
        return annotationView
    }
    
    func mapView(_ mapView: MapType, didSelect view: AnnotationViewType) {
        guard let annotationView = view as? AnnotationViewAbstraction else { return }
        let identifier = annotationView.data.id
        let coordinate = annotationView.data.coordinate
        annotationSelected?(identifier)
        interactor.focus(on: coordinate)
    }
    
}
