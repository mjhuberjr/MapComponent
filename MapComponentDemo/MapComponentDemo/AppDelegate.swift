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
        let rootCoordinator = MapComponentCoordinator(dataSource: nil)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootCoordinator.mapComponentViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

