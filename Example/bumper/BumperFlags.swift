//
//  BumperFlags.swift
//  Letgo
//
//  GENERATED - DO NOT MODIFY - use flags_generator instead.
// 
//  Copyright © 2016 Letgo. All rights reserved.
//

import Foundation
import bumper

extension Bumper  {
    static func initialize() {
        Bumper.initialize([FlagTest1.self, FlagTest2.self, FlagTest3.self])
    } 

    var flagTest1: FlagTest1 {
        guard let value = Bumper.valueForKey(FlagTest1.key) else { return .value1 }
        return FlagTest1(rawValue: value) ?? .value1
    }

    var flagTest2: FlagTest2 {
        guard let value = Bumper.valueForKey(FlagTest2.key) else { return .value1 }
        return FlagTest2(rawValue: value) ?? .value1
    }

    var flagTest3: FlagTest3 {
        guard let value = Bumper.valueForKey(FlagTest3.key) else { return .value1 }
        return FlagTest3(rawValue: value) ?? .value1
    } 
}


enum FlagTest1: String, BumperFlag  {
    case value1, value2, value3
    static var defaultValue: String { return FlagTest1.value1.rawValue }
    static var enumValues: [FlagTest1] { return [.value1, .value2, .value3]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "Flag Test 1" }
}

enum FlagTest2: String, BumperFlag  {
    case value1, value2, value3
    static var defaultValue: String { return FlagTest2.value1.rawValue }
    static var enumValues: [FlagTest2] { return [.value1, .value2, .value3]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "Flag Test 2" }
}

enum FlagTest3: String, BumperFlag  {
    case value1, value2, value3
    static var defaultValue: String { return FlagTest3.value1.rawValue }
    static var enumValues: [FlagTest3] { return [.value1, .value2, .value3]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "Flag Test 3" }
}

