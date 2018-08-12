//
//  Defaults.swift
//  SmileyMenu
//
//  Created by Bart van Kuik on 11/08/2018.
//  Copyright © 2018 DutchVirtual. All rights reserved.
//

import Cocoa

struct Defaults {
    struct Keys {
        static let recent = "recent"
    }

    static func register() {
        let defaults = [
            Keys.recent: [String]()
        ]
        UserDefaults.standard.register(defaults: defaults)
    }
}
