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
    
    fileprivate let rootViewController: MapRootViewController
    fileprivate let interactor: MapInteraction? = nil
    
    public init(dataSource: MapDataSource?, dataFormattable: MapDataFormattable? = nil, mapConfigurable: MapConfigurable? = nil, mapEvents: MapEvents? = nil) {
        let dataFormatter = dataFormattable ?? MapDataFormattableImpl()
        let mapConfiguration = mapConfigurable ?? MapConfigurableImpl()
        let dataSource = dataSource ?? PrototypeData()
        let presenter = MapComponentPresenter(dataSource: dataSource, dataFormatter: dataFormatter, mapConfiguration: mapConfiguration)
        rootViewController = MapRootViewController(presenter: presenter)
//        interactor = rootViewController.interactor
    }
    
    public func mapComponentViewController() -> UIViewController {
        return rootViewController
    }
    
}

// MARK: - Map Interactions

extension MapComponentCoordinator {

    public func recenter() {
        interactor?.recenter()
    }

    public func selectAnnotation(_ identifier: String) {
        interactor?.selectAnnotation(with: identifier)
    }
    
    public func deslectAnnotation() {
        interactor?.deselectAnnotation()
    }

}
