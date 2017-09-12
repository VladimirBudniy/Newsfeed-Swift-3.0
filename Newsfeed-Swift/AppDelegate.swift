//
//  AppDelegate.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 12/29/16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

import UIKit
import MagicalRecord
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        MagicalRecord.setupCoreDataStack(withStoreNamed: "Newsfeed_Swift")
        UIApplication.shared.statusBarStyle = .lightContent
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = SlideMenuController.initSlideMenuController()
        
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
}
