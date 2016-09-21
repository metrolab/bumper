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

struct BumperViewData {
    let key: String
    let description: String
    let value: String
    let options: [String]
}

class BumperViewModel {

    weak var delegate: BumperViewModelDelegate?

    private(set) var enabled: Bool
    private var viewData: [BumperViewData]

    init() {
        viewData = Bumper.bumperViewData
        enabled = Bumper.enabled
    }

    var featuresCount: Int {
        return viewData.count
    }

    func featureNameAtIndex(index: Int) -> String {
        return viewData[index].description
    }

    func featureValueAtIndex(index: Int) -> String {
        return viewData[index].value
    }

    func featureSelectedAtIndex(index: Int) {
        delegate?.showFeature(index, itemsSelection: viewData[index].options)
    }

    func selectedFeature(index: Int, item: String) {
        let data = viewData[index]
        Bumper.setValueForKey(data.key, value: item)
        viewData = Bumper.bumperViewData
        delegate?.featuresUpdated()
    }

    func setEnabled(enabled: Bool) {
        Bumper.enabled = enabled
        self.enabled = enabled
    }
}
