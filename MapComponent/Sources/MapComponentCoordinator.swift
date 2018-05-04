//
//  MapCoordinator.swift
//  MapComponent
//
//  Created by Michael J. Huber Jr. on 5/4/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import Foundation

public protocol MapComponentCoordination: class {
    
    func mapComponentViewController() -> UIViewController
    
}

public class MapComponentCoordinator: MapComponentCoordination, MapEvents {
    
    fileprivate var rootViewController: MapRootViewController
    
    // Map Events
    var annotationSelected: MapEventClosure?
    
    public init(annotationSelected: MapEventClosure?) {
        self.rootViewController = MapRootViewController()
        self.annotationSelected = annotationSelected
    }
    
    public func mapComponentViewController() -> UIViewController {
        return rootViewController
    }
    
}

// MARK: - Private methods

private extension MapComponentCoordinator {
    
    
    
}

// MARK: - Map Interactions

extension MapComponentCoordinator: MapInteractions {

    public func zoomIn() {
        
    }

    public func zoomOut() {
        
    }

    public func recenter() {
        
    }

    public func selectAnnotation() {
        
    }

}
