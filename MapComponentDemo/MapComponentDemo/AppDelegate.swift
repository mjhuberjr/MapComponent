//
//  AppDelegate.swift
//  MapComponentDemo
//
//  Created by Michael J. Huber Jr. on 5/10/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit
import MapComponent

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        struct MapDataFormatter: MapDataFormattable {
            func formatTitle(for object: MapDataObject) -> String? {
                let title = object.title ?? ""
                return "$\(title)"
            }
            
            func formatTitleSelected(for object: MapDataObject) -> String? {
                return formatTitle(for: object)
            }
        }
        let dataFormatter = MapDataFormatter()
        let rootCoordinator = MapComponentCoordinator(adapter: nil, dataFormattable: dataFormatter, mapConfigurable: nil)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootCoordinator.mapComponentViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

