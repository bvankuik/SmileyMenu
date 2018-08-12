//
//  Menu.swift
//  SmileyMenu
//
//  Created by Bart van Kuik on 10/08/2018.
//  Copyright © 2018 DutchVirtual. All rights reserved.
//

import Cocoa

extension AppDelegate: NSMenuDelegate {
    
    func menuWillOpen(_ menu: NSMenu) {
        menu.removeAllItems()
        
        if let recentArray = UserDefaults.standard.array(forKey: Defaults.Keys.recent) as? [String] {
            let recentHeader = NSMenuItem(title: "Recent", action: nil, keyEquivalent: "")
            menu.addItem(recentHeader)
            
            for recent in recentArray {
                let item = NSMenuItem(title: recent, action: #selector(applyPasteboardFromMenu(_:)), keyEquivalent: "")
                menu.addItem(item)
            }
            menu.addItem(NSMenuItem.separator())
        }

        for smiley in smileyArray {
            let item = NSMenuItem(title: smiley, action: #selector(applyPasteboardFromMenu(_:)), keyEquivalent: "")
            item.representedObject = smiley
            menu.addItem(item)
        }
        
        menu.addItem(NSMenuItem.separator())
        menu.addItem(quitItem)
    }
    
    @objc func applyPasteboardFromMenu(_ sender: NSMenuItem) {
        guard let representedObject = sender.representedObject as? String else {
            return
        }

        self.saveAsRecent(sender)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(representedObject, forType: .string)
    }
    
    private func saveAsRecent(_ menuItem: NSMenuItem) {
        var recentArray: [String] = []
        if let array = UserDefaults.standard.array(forKey: Defaults.Keys.recent) as? [String] {
            recentArray = array
        }
        
        guard let first = recentArray.first, first != menuItem.title else {
            // Ignore if user made the same choice again
            return
        }

        recentArray.insert(menuItem.title, at: 0)
        if recentArray.count > 5 {
            recentArray.removeLast(recentArray.count - 5)
        }
        
        UserDefaults.standard.set(recentArray, forKey: Defaults.Keys.recent)
    }
}
