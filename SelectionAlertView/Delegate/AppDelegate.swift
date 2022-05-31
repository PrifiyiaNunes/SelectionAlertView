//
//  AppDelegate.swift
//  SelectionAlertView
//
//  Created by Prifiyia on 30/05/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =
            storyboard.instantiateViewController(withIdentifier: "MainController") as? MainController
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        return true
    }
}

