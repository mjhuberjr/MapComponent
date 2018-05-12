//
//  MapTypes.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/3/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import MapKit

// These types are used in the Abstraction classes to decouple us from MapKit incase we decide to switch to Mapbox
// If we switch to Mapbox we can swap the import to mapbox and the typealias' to MGLMapView, MGLAnnotation, and MGLAnnotationView

typealias MapType = MKMapView
typealias MapTypeCamera = MKMapCamera
typealias MapTypeDelegate = MKMapViewDelegate
typealias AnnotationType = MKAnnotation
typealias AnnotationViewType = MKAnnotationView
