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
        guard let value = Bumper.value(for: NameOfFirstFeature.key) else { return .firstValue }
        return NameOfFirstFeature(rawValue: value) ?? .firstValue 
    }

    static var nameOfSecondFeature: Bool {
        guard let value = Bumper.value(for: NameOfSecondFeature.key) else { return true }
        return NameOfSecondFeature(rawValue: value)?.asBool ?? true
    }

    static var nameOfThirdFeature: Bool {
        guard let value = Bumper.value(for: NameOfThirdFeature.key) else { return true }
        return NameOfThirdFeature(rawValue: value)?.asBool ?? true
    } 
}


enum NameOfFirstFeature: String, BumperFeature  {
    case firstValue, secondValue, thirdValue
    static var defaultValue: String { return NameOfFirstFeature.firstValue.rawValue }
    static var enumValues: [NameOfFirstFeature] { return [.firstValue, .secondValue, .thirdValue]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "First test description" } 
    static func fromPosition(_ position: Int) -> NameOfFirstFeature {
        switch position { 
            case 0: return .firstValue
            case 1: return .secondValue
            case 2: return .thirdValue
            default: return .firstValue
        }
    }
}

enum NameOfSecondFeature: String, BumperFeature  {
    case yes, no
    static var defaultValue: String { return NameOfSecondFeature.yes.rawValue }
    static var enumValues: [NameOfSecondFeature] { return [.yes, .no]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "Boolean test description" } 
    var asBool: Bool { return self == .yes }
}

enum NameOfThirdFeature: String, BumperFeature  {
    case yes, no
    static var defaultValue: String { return NameOfThirdFeature.yes.rawValue }
    static var enumValues: [NameOfThirdFeature] { return [.yes, .no]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "Boolean test description" } 
    var asBool: Bool { return self == .yes }
}

