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


    override func viewDidLoad() {
        super.viewDidLoad()

        pushBumperButton.layer.cornerRadius = 10;
        pushBumperButton.layer.borderWidth = 1;
        pushBumperButton.layer.borderColor = UIColor.darkGrayColor().CGColor

        presentBumperButton.layer.cornerRadius = 10;
        presentBumperButton.layer.borderWidth = 1;
        presentBumperButton.layer.borderColor = UIColor.darkGrayColor().CGColor

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

