//
//  AppDelegate.swift
//  SmileyMenu
//
//  Created by Bart van Kuik on 10/08/2018.
//  Copyright © 2018 DutchVirtual. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let statusMenu = NSMenu()
    let quitItem = NSMenuItem(title: NSLocalizedString("Quit", comment: "Quit menu item"), action: #selector(NSApp.terminate), keyEquivalent: "q")

    override init() {
        super.init()
        
        statusMenu.delegate = self
        
        statusItem.image = #imageLiteral(resourceName: "baseline-sentiment_satisfied_alt-24px_black")
        statusItem.menu = statusMenu
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

extension AppDelegate: NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        menu.removeAllItems()
        menu.addItem(NSMenuItem.separator())
        menu.addItem(quitItem)
    }
}
