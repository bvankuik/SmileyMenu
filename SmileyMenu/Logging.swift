//
//  Logging.swift
//  SurveyKit
//
//  Created by Bart van Kuik on 19/07/2018.
//  Copyright © 2018 DutchVirtual. All rights reserved.
//

import Cocoa
import os.log

// This whole file is an atrocity but I can't find any other way. See also:
// https://stackoverflow.com/questions/46498121/passing-variadic-args-in-swift-4-for-os-log

struct Log {
    static let log = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "(missing bundleIdentifier)",
                           category: "SmileyMenu")

    static func debug(_ message: StaticString, _ arguments: Any...) {
        let args = arguments.map {
            String(describing: $0)
        }
        switch args.count {
        case 0:
            os_log(message, log: log, type: .debug)
        case 1:
            os_log(message, log: log, type: .debug, args[0])
        case 2:
            os_log(message, log: log, type: .debug, args[0], args[1])
        case 3:
            os_log(message, log: log, type: .debug, args[0], args[1], args[2])
        default:
            os_log(message, log: log, type: .debug, args)
        }
    }

    static func info(_ message: StaticString, _ arguments: Any...) {
        let args = arguments.map {
            String(describing: $0)
        }
        switch args.count {
        case 0:
            os_log(message, log: log, type: .info)
        case 1:
            os_log(message, log: log, type: .info, args[0])
        case 2:
            os_log(message, log: log, type: .info, args[0], args[1])
        case 3:
            os_log(message, log: log, type: .info, args[0], args[1], args[2])
        default:
            os_log(message, log: log, type: .info, args)
        }
    }

    static func fault(_ message: StaticString, _ arguments: Any...) {
        let args = arguments.map {
            String(describing: $0)
        }
        switch args.count {
        case 0:
            os_log(message, log: log, type: .fault)
        case 1:
            os_log(message, log: log, type: .fault, args[0])
        case 2:
            os_log(message, log: log, type: .fault, args[0], args[1])
        case 3:
            os_log(message, log: log, type: .fault, args[0], args[1], args[2])
        default:
            os_log(message, log: log, type: .fault, args)
        }
    }

    static func error(_ message: StaticString, _ arguments: Any...) {
        let args = arguments.map {
            String(describing: $0)
        }
        switch args.count {
        case 0:
            os_log(message, log: log, type: .error)
        case 1:
            os_log(message, log: log, type: .error, args[0])
        case 2:
            os_log(message, log: log, type: .error, args[0], args[1])
        case 3:
            os_log(message, log: log, type: .error, args[0], args[1], args[2])
        default:
            os_log(message, log: log, type: .error, args)
        }
    }
}
