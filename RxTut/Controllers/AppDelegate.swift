//
//  AppDelegate.swift
//  RxTut
//
//  Created by Len X van Zyl on 8/20/18.
//  Copyright © 2018 Len X van Zyl. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
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

