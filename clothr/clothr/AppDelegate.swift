//
//  AppDelegate.swift
//  clothr
//
//  Created by Czar Vince Gabriel Cabral on 10/21/17.
//  Copyright © 2017 cmps115. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		// sets up PopSugarShop client
        PSSClient.shared().partnerID = "uid3601-40030551-1"

        // set up configurations for parse server
        let config = ParseClientConfiguration  { (theConfig) in
            theConfig.applicationId = "clothr"
            theConfig.server = "http://clothr.herokuapp.com/parse"
            theConfig.clientKey = "clotherMasterKey115"
        }
        
        // line to view parse server dashboard hosted on your own host computer
        //parse-dashboard --appId clothr --masterKey clotherMasterKey115 --serverURL "http://clothr.herokuapp.com/parse"
        Parse.initialize(with: config)
        
		// if the User is currently logged in to Parse, then go straight to the Main page
        let currentUser = PFUser.current()
        if currentUser != nil {
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let initialViewController = storyboard.instantiateViewController(withIdentifier: "MainViewNavigationController")
			window?.rootViewController = initialViewController
            window?.makeKeyAndVisible()
        }

        return true
	}
	
	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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

