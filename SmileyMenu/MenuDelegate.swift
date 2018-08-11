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
        
        if !self.recentItems.isEmpty {
            let recentHeader = NSMenuItem(title: "Recent", action: nil, keyEquivalent: "")
            menu.addItem(recentHeader)
            
            for item in self.recentItems {
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
        let recentItem = NSMenuItem(title: sender.title, action: sender.action, keyEquivalent: sender.keyEquivalent)
        self.recentItems.insert(recentItem, at: 0)
        if self.recentItems.count > 5 {
            self.recentItems.removeLast(self.recentItems.count - 5)
        }
        
        guard let representedObject = sender.representedObject as? String else {
            return
        }
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(representedObject, forType: .string)
    }

}
