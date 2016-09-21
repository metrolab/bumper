//
//  Bumper.swift
//  Pods
//
//  Created by Eli Kohen on 21/09/16.
//  Copyright © 2016 Letgo. All rights reserved.
//

import Foundation

public class Bumper {
    public internal(set) static var enabled: Bool = false {
        didSet {
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(enabled, forKey: "bumper_enabled")
            userDefaults.synchronize()
        }
    }
    static var cache = [String: String]()
    static var flags: [BumperFlag.Type] = []

    static var bumperViewData: [BumperViewData] {
        return flags.flatMap { flagType in
            let value = valueForKey(flagType.key) ?? flagType.defaultValue
            return BumperViewData(key: flagType.key, description: flagType.description, value: value, options: flagType.values)
        }
    }

    public static func initialize(bumperFlags: [BumperFlag.Type]) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        enabled = userDefaults.boolForKey("bumper_enabled")

        cache.removeAll()
        flags = bumperFlags
        flags.forEach({
            guard let value = userDefaults.stringForKey($0.key) else { return }
            cache[$0.key] = value
        })
    }

    public static func valueForKey(key: String) -> String? {
        return cache[key]
    }

    static func setValueForKey(key: String, value: String) {
        cache[key] = value
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(value, forKey: key)
        userDefaults.synchronize()
    }

}

public protocol BumperFlag {
    static var key: String { get }
    static var values: [String] { get }
    static var defaultValue: String { get }
    static var description: String { get }
}

public extension BumperFlag {
    static var key: String {
        return String(Self)
    }
}
