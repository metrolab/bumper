//
//  BumperFeatures.swift
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
        Bumper.initialize([NameOfFirstFeature.self, NameOfSecondFeature.self, NameOfThirdFeature.self])
    } 

    static var nameOfFirstFeature: NameOfFirstFeature {
        guard let value = Bumper.valueForKey(NameOfFirstFeature.key) else { return .FirstValue }
        return NameOfFirstFeature(rawValue: value) ?? .FirstValue 
    }

    static var nameOfSecondFeature: Bool {
        guard let value = Bumper.valueForKey(NameOfSecondFeature.key) else { return true }
        return NameOfSecondFeature(rawValue: value)?.asBool ?? true
    }

    static var nameOfThirdFeature: Bool {
        guard let value = Bumper.valueForKey(NameOfThirdFeature.key) else { return true }
        return NameOfThirdFeature(rawValue: value)?.asBool ?? true
    } 
}


enum NameOfFirstFeature: String, BumperFeature  {
    case FirstValue, SecondValue, ThirdValue
    static var defaultValue: String { return NameOfFirstFeature.FirstValue.rawValue }
    static var enumValues: [NameOfFirstFeature] { return [.FirstValue, .SecondValue, .ThirdValue]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "First test description" } 
    static func fromPosition(position: Int) -> NameOfFirstFeature {
        switch position { 
            case 0: return .FirstValue
            case 1: return .SecondValue
            case 2: return .ThirdValue
            default: return .FirstValue
        }
    }
}

enum NameOfSecondFeature: String, BumperFeature  {
    case Yes, No
    static var defaultValue: String { return NameOfSecondFeature.Yes.rawValue }
    static var enumValues: [NameOfSecondFeature] { return [.Yes, .No]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "Boolean test description" } 
    var asBool: Bool { return self == .Yes }
}

enum NameOfThirdFeature: String, BumperFeature  {
    case Yes, No
    static var defaultValue: String { return NameOfThirdFeature.Yes.rawValue }
    static var enumValues: [NameOfThirdFeature] { return [.Yes, .No]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "Boolean test description" } 
    var asBool: Bool { return self == .Yes }
}

