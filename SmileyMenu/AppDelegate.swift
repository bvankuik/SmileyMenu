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
    private let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    private let statusMenu = NSMenu()
    
    let quitItem = NSMenuItem(title: NSLocalizedString("Quit", comment: "Quit menu item"), action: #selector(NSApp.terminate), keyEquivalent: "q")
    
    override init() {
        super.init()
        
        statusMenu.delegate = self
        statusItem.image = #imageLiteral(resourceName: "baseline-sentiment_satisfied_alt-24px_black")
        statusItem.menu = statusMenu
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        Defaults.register()
//        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
//            Log.error("No bundle identifier, exiting")
//            exit(1)
//        }
//
//        do {
//            let appsupport = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//            let appdir = appsupport.appendingPathComponent(bundleIdentifier, isDirectory: true)
//            try FileManager.default.createDirectory(at: appdir, withIntermediateDirectories: true, attributes: nil)
//        } catch {
//            Log.fault("Couldn't create preferences file, continuing")
//        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        UserDefaults.standard.synchronize()
    }
}
