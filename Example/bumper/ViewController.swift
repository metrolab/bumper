//
//  ViewController.swift
//  bumper
//
//  Created by Eli Kohen on 09/21/2016.
//  Copyright (c) 2016 Eli Kohen. All rights reserved.
//

import UIKit
import bumper

class ViewController: UIViewController {

    @IBOutlet weak var pushBumperButton: UIButton!
    @IBOutlet weak var presentBumperButton: UIButton!

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        pushBumperButton.layer.cornerRadius = 10
        pushBumperButton.layer.borderWidth = 1
        pushBumperButton.layer.borderColor = UIColor.darkGrayColor().CGColor

        presentBumperButton.layer.cornerRadius = 10
        presentBumperButton.layer.borderWidth = 1
        presentBumperButton.layer.borderColor = UIColor.darkGrayColor().CGColor


        // Just to show creation of enums by helper
        let firstFeature = NameOfFirstFeature.fromPosition(1)
        print("First feature from position: \(firstFeature)")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        firstLabel.text = "FirstFeature: \(Bumper.nameOfFirstFeature)"
        secondLabel.text = "SecondFeature: \(Bumper.nameOfSecondFeature)"
        thirdLabel.text = "ThirdFeature: \(Bumper.nameOfThirdFeature)"
    }

    @IBAction func openBumper(sender: AnyObject) {
        let vc = BumperViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func presentBumper(sender: AnyObject) {
        let vc = BumperViewController()
        let navC = UINavigationController(rootViewController: vc)
        presentViewController(navC, animated: true, completion: nil)
    }
}

