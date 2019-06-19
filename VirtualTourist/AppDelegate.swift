//
//  AppDelegate.swift
//  VirtualTourist
//
//  Created by Sarah Rebecca Estrellado on 5/25/19.
//  Copyright © 2019 Sarah Rebecca Estrellado. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let dataController = DataController(modelName: "VirtualTourist")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        dataController.load()
        let navigationController = window?.rootViewController as! UINavigationController
        let MapVC = navigationController.topViewController as! MapVC
        MapVC.dataController = dataController
        return true
    }
}

