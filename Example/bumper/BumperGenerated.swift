//
//  BumperGenerated.swift
//  bumper
//
//  Created by Eli Kohen on 21/09/16.
//  Copyright © 2016 Letgo. All rights reserved.
//

import Foundation
import bumper

//Generado
extension Bumper  {
    static func initialize() {
        Bumper.initialize([MyABTestCase.self])
    }

    var myABTest: MyABTestCase {
        guard let value = Bumper.valueForKey(MyABTestCase.key) else { return .A }
        return MyABTestCase(rawValue: value) ?? .A
    }
}


enum MyABTestCase: String, BumperFlag  {
    case A, B, C
    static var defaultValue: String { return MyABTestCase.A.rawValue }
    static var testValues: [MyABTestCase] { return [.A, .B, .C]}
    static var values: [String] { return testValues.map{$0.rawValue} }
    static var description: String { return "MyTest description" }
}