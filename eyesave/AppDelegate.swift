//
//  AppDelegate.swift
//  eyesave
//
//  Created by Max Eder on 04.11.20.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var statusBarItem: NSStatusItem!



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Status Bar
        let statusBar = NSStatusBar.system
        
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.squareLength)
        
        //statusBarItem.button?.title = "👀"
        statusBarItem.button?.image = NSImage(named: "Icon")
        let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")
        
        statusBarItem.menu = statusBarMenu
        
        statusBarMenu.addItem(
            withTitle: "Start Timer",
            action: #selector(AppDelegate.startTimer),
            keyEquivalent: "")

        statusBarMenu.addItem(
            withTitle: "Cancel Timer",
            action: #selector(AppDelegate.cancelTimer),
            keyEquivalent: "")
 
    }
    
    
    
    @objc func startTimer() {
        print("Starting Timer")
        
        let notification = NSUserNotification()
            notification.title = "EyeSave"
            notification.subtitle = "Take a break!"
            notification.soundName = NSUserNotificationDefaultSoundName
            NSUserNotificationCenter.default.deliver(notification)
        
        notification.deliveryDate = Date(timeIntervalSinceNow: 5)
        NSUserNotificationCenter.default.scheduleNotification(notification)
    }

    @objc func cancelTimer() {
        print("Canceled Timer")
    }
    
    

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

