//
//  Bumper.swift
//  Pods
//
//  Created by Eli Kohen on 21/09/16.
//  Copyright © 2016 Letgo. All rights reserved.
//

import Foundation

open class Bumper {

    // MARK: - Public static

    open static var enabled: Bool {
        return Bumper.sharedInstance.enabled
    }

    open static func initialize(_ bumperFeatures: [BumperFeature.Type]) {
        Bumper.sharedInstance.initialize(bumperFeatures)
    }

    open static func valueForKey(_ key: String) -> String? {
        return Bumper.sharedInstance.valueForKey(key)
    }

    // MARK: - Internal

    static let sharedInstance: Bumper = Bumper(bumperDAO: UserDefaults.standard)

    fileprivate static let bumperEnabledKey = "bumper_enabled"
    fileprivate static let bumperPrefix = "bumper_"

    var enabled: Bool = false {
        didSet {
            bumperDAO.setBool(enabled, forKey: Bumper.bumperEnabledKey)
        }
    }
    fileprivate var cache = [String: String]()
    fileprivate var features: [BumperFeature.Type] = []

    var bumperViewData: [BumperViewData] {
        return features.flatMap { featureType in
            let value = valueForKey(featureType.key) ?? featureType.defaultValue
            return BumperViewData(key: featureType.key, description: featureType.description, value: value, options: featureType.values)
        }
    }

    fileprivate let bumperDAO: BumperDAO

    init(bumperDAO: BumperDAO) {
        self.bumperDAO = bumperDAO
    }

    func initialize(_ bumperFeatures: [BumperFeature.Type]) {
        enabled = bumperDAO.boolForKey(Bumper.bumperEnabledKey)

        cache.removeAll()
        features = bumperFeatures
        features.forEach({
            guard let value = bumperDAO.stringForKey(Bumper.bumperPrefix + $0.key) else { return }
            cache[$0.key] = value
        })
    }

    func valueForKey(_ key: String) -> String? {
        return cache[key]
    }

    func setValueForKey(_ key: String, value: String) {
        cache[key] = value
        bumperDAO.setObject(value, forKey: Bumper.bumperPrefix + key)
    }
}

extension UserDefaults: BumperDAO {}
