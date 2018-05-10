//
//  AppDelegate.swift
//  MapComponentDemo
//
//  Created by Michael J. Huber Jr. on 5/9/18.
//  Copyright © 2018 operation thirteenOne. All rights reserved.
//

import UIKit
import MapComponent

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let coordinator = MapComponentCoordinator()
        return true
    }

}

