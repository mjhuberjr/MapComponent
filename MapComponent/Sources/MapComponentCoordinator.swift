//
//  MapCoordinator.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/4/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

private protocol MapComponentCoordination: class {
    
    var rootViewController: MapRootViewController { get }
    func mapComponentViewController() -> UIViewController
    
    // Map Interactions
    func zoomIn()
    func zoomOut()
    func recenter()
    func selectAnnotation()
    
    // Map Events
    var annotationSelected: MapEventClosure? { get }
    
}

public class MapComponentCoordinator: MapComponentCoordination {
    
    fileprivate var rootViewController: MapRootViewController
    
    // Map Events
    fileprivate var annotationSelected: MapEventClosure?
    
    public init(annotationSelected: MapEventClosure?) {
        self.rootViewController = MapRootViewController()
        self.annotationSelected = annotationSelected
    }
    
}

// MARK: - Private methods

private extension MapComponentCoordinator {
    
    func mapComponentViewController() -> UIViewController {
        return rootViewController
    }
    
    func zoomIn() {
        
    }
    
    func zoomOut() {
        
    }
    
    func recenter() {
        
    }
    
    func selectAnnotation() {
        
    }
    
}
