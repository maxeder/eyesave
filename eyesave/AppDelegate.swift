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
        
        statusBarItem.button?.title = "👀"
        
        let statusBarMenu = NSMenu(title: "Cap Status Bar Menu")
        
        statusBarItem.menu = statusBarMenu
        
        
        
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view.
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

