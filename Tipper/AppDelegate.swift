//
//  AppDelegate.swift
//  Tipper
//
//  Created by Mohit Taneja on 8/14/17.
//  Copyright © 2017 Mohit Taneja. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //UINavigationBar.alpha
        // Retrive the time when the billField was last saved, and update the billField
        // if it was saved less than 5 minutes ago
        let defaults = UserDefaults.standard
        let lastSavetime = (defaults.object(forKey: "tipper.billFieldLastSaveTime") ??         Date.init(timeIntervalSince1970: 0)) as! Date
        let currentTime = Date.init()
        if (currentTime.timeIntervalSince(lastSavetime)/60 < 5) {
            if let viewControllers = self.window!.rootViewController?.childViewControllers {
                for viewController in viewControllers {
                    if viewController.isKind(of: ViewController.self) {
                        let targetViewController = viewController as! ViewController
                        let billFieldValue = defaults.string(forKey: "tipper.billField") ?? ""
                        targetViewController.lastSavedBillValue = billFieldValue
                        print(targetViewController.lastSavedBillValue)
                    }
                }
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
        // Obtain the viewController for the tip view, and save the 
        // current time and billField text to user defaults
        if let viewControllers = self.window!.rootViewController?.childViewControllers {
            for viewController in viewControllers {
                if viewController.isKind(of: ViewController.self) {
                    let targetViewController = viewController as! ViewController
                    let defaults = UserDefaults.standard
                    defaults.set(targetViewController.billField.text! as String, forKey: "tipper.billField")
                    defaults.set(Date.init(), forKey: "tipper.billFieldLastSaveTime")
                    defaults.synchronize()
                    print(targetViewController.billField.text!)
                }
            }
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

