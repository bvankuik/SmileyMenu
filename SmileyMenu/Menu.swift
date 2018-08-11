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
        
        for smiley in smileyArray {
            let item = NSMenuItem(title: smiley, action: #selector(applyPasteboardFromMenu), keyEquivalent: "")
            item.representedObject = smiley
            menu.addItem(item)
        }
        
        menu.addItem(NSMenuItem.separator())
        menu.addItem(quitItem)
    }
    
    @objc func applyPasteboardFromMenu(_ sender: NSMenuItem) {
        print("OH HAI: \(sender.title)")
        guard let representedObject = sender.representedObject as? String else {
            return
        }
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(representedObject, forType: .string)
    }

}
