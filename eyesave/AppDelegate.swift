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
    var timer: Timer!
    var popover: NSPopover!



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Status Bar
        let statusBar = NSStatusBar.system
        
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.squareLength)
        
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
        
        statusBarMenu.addItem(NSMenuItem.separator())
        
        statusBarMenu.addItem(
            withTitle: "About",
            action: #selector(togglePopover(_:)),
            keyEquivalent: "")
        
        statusBarMenu.addItem(NSMenuItem.separator())
        
        statusBarMenu.addItem(
            withTitle: "Quit EyeSave",
            action: #selector(AppDelegate.quitApp),
            keyEquivalent: "")
        
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        
        // create popover
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 400, height: 400)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        self.popover = popover
        
 
    }
    
    
    
    @objc func startTimer() {
        print("Starting Timer")
        
        if timer == nil {
        timer = Timer.scheduledTimer(timeInterval: 1200, target: self, selector: #selector(sendNotification), userInfo: nil, repeats: true)
        }
    }

    @objc func cancelTimer() {
        print("Canceled Timer")
       
        if timer != nil {
             timer!.invalidate()
             timer = nil
          }
    }
    
    
    @objc func togglePopover(_ sender: AnyObject?) {
         if let button = self.statusBarItem.button {
              if self.popover.isShown {
                   self.popover.performClose(sender)
              } else {
                   self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
              }
         }
    }
    
    @objc func sendNotification() {
        print("Send Notification")
        let notification = NSUserNotification()
            notification.title = "EyeSave"
            notification.subtitle = "Take a break!"
            notification.soundName = NSUserNotificationDefaultSoundName
            NSUserNotificationCenter.default.deliver(notification)
    }
    
    @objc func quitApp() {
        cancelTimer()
        NSApplication.shared.terminate(self)
    }
    

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        cancelTimer()
    }


}

