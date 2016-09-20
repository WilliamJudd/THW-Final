//
//  AppDelegate.swift
//  THW Final
//
//  Created by William Judd on 4/1/16.
//  Copyright © 2016 William Judd. All rights reserved.



import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var deviceID: String?
//    var ref: Firebase!
    var emailSubject: String!
    var emailBody: String!
    let preferences = UserDefaults.standard
    var failedAuth = false
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        Firebase.defaultConfig().persistenceEnabled = true
        
        
//        
//        if preferences.objectForKey("deviceID") == nil {
//            deviceID = randomStringWithLength(6)
//            preferences.setObject(deviceID, forKey: "deviceID")
//            preferences.synchronize()
//            
//        } else {
//            deviceID = preferences.stringForKey("deviceID")
//            print(deviceID)
//            
//        }
//        self.emailSubject = preferences.stringForKey("emailSubject")
//        self.emailBody = preferences.stringForKey("emailBody")
//        failedAuth = false
////        auth()
        
        return true
        
    }
    
//    func auth() {
//        ref = Firebase(url:"https://thw.firebaseio.com/")
//        ref.authWithCustomToken("8ooR6HfTrgrPOWw9tGaeiY9SYm7EMbnBSsmjYojs", withCompletionBlock: { error, authData in
//            self.failedAuth = error != nil
//            self.ref.childByAppendingPath("settings/subject").observeEventType(.Value, withBlock: {
//                snapshot in
//                if (snapshot.value != nil) {
//                    self.emailSubject = snapshot.value as? String
//                    if self.emailSubject == nil { self.emailSubject = "Your Photo" }
//                    self.preferences.setObject(self.emailSubject, forKey: "emailSubject")
//                    self.preferences.synchronize()
//                }
//            })
//            self.ref.childByAppendingPath("settings/body").observeEventType(.Value, withBlock: {
//                snapshot in
//                if (snapshot.value != nil) {
//                    self.emailBody = snapshot.value as? String
//                    if self.emailBody == nil { self.emailBody = "" }
//                    self.preferences.setObject(self.emailBody, forKey: "emailBody")
//                    self.preferences.synchronize()
//                }
//            })
//        })
//    }
    
//    func randomStringWithLength (len : Int) -> String {
//        
//        let letters : NSString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        
//        let randomString : NSMutableString = NSMutableString(capacity: len)
//        
//        for (var i=0; i < len; i++){
//            let length = UInt32 (letters.length)
//            let rand = arc4random_uniform(length)
//            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
//        }
//        
//        return randomString as String
//    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

