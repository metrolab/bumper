//
//  BumperViewModel.swift
//  Pods
//
//  Created by Eli Kohen on 21/09/16.
//
//

import Foundation

protocol BumperViewModelDelegate: class {
    func featuresUpdated()
    func showFeature(feature: Int, itemsSelection items: [String])
}

class BumperViewModel {

    weak var delegate: BumperViewModelDelegate?

    var featuresCount: Int {
        return 10
    }

    func featureNameAtIndex(index: Int) -> String {
        return String(index)
    }

    func featureValueAtIndex(index: Int) -> String {
        return String(index)
    }

    func featureSelectedAtIndex(index: Int) {
        delegate?.showFeature(index, itemsSelection: ["Uno", "Dos", "Tres"])
    }

    func selectedFeature(index: Int, item: String) {
        
    }
}
