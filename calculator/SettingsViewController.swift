//
//  SettingsViewController.swift
//  calculator
//
//  Created by Nicolai Safai on 1/27/16.
//  Copyright © 2016 Lime. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_index")
    }
    
    @IBAction func changeDefaultTip(sender: AnyObject) {
        var chosenIndex =  [0, 1, 2]
        let defaultTipIndex = chosenIndex[tipControl.selectedSegmentIndex]
        
       // store to coredata
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipIndex, forKey: "default_tip_index")
        defaults.synchronize()
//        print("default_tip_index has been set to %f%", defaultTip)
    }
}
