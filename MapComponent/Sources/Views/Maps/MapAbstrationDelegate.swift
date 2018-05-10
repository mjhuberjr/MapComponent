//
//  MapAbstrationDelegate.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/9/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

class MapAbstractionDelegate: NSObject, MapEvents {
    var annotationSelected: MapEventClosure?
    
    init(mapConfiguration: MapConfigurable) {
        let mapEvents = mapConfiguration.mapEvents
        self.annotationSelected = mapEvents.annotationSelected
    }
    
}

// MARK: - MapType Delegate

extension MapAbstractionDelegate: MapTypeDelegate {
    
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
