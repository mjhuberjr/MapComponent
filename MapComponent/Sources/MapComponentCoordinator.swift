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

// MARK: - Default implementations if not passed in from consumer of MapComponent

class MapDataFormattableImpl: MapDataFormattable { init() { } }
class MapConfigurableImpl: MapConfigurable { init() { } }

public class MapComponentCoordinator: MapComponentCoordination {
    
    fileprivate var rootViewController: MapRootViewController
    
    public init(dataSource: MapDataSource, dataFormattable: MapDataFormattable? = nil, mapConfigurable: MapConfigurable? = nil, mapEvents: MapEvents? = nil) {
        let dataFormatter = dataFormattable ?? MapDataFormattableImpl()
        let mapConfiguration = mapConfigurable ?? MapConfigurableImpl()
        let presenter = MapComponentPresenter(dataSource: dataSource, dataFormatter: dataFormatter, mapConfiguration: mapConfiguration)
        self.rootViewController = MapRootViewController(presenter: presenter)
    }
    
    public func mapComponentViewController() -> UIViewController {
        return rootViewController
    }
    
}

// MARK: - Private methods

private extension MapComponentCoordinator {
    
    
    
}

// MARK: - Map Interactions

extension MapComponentCoordinator: MapInteractor {

    public func zoomIn() {
        
    }

    public func zoomOut() {
        
    }

    public func recenter() {
        
    }

    public func selectAnnotation() {
        
    }

}
