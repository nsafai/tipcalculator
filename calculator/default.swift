//
//  ViewController.swift
//  calculator
//
//  Created by Nicolai Safai on 1/23/16.
//  Copyright © 2016 Lime. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {


    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmountField.becomeFirstResponder()
    
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_index")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEdit(sender: AnyObject) {
        
        var tipPercentages =  [0.1, 0.15, 0.2]
        let chosenTip = tipPercentages[tipControl.selectedSegmentIndex]

        if let billAmount = Double(billAmountField.text!) {
//            print(billAmount)
            let tipAmount = billAmount*chosenTip
            let totalAmount = billAmount+tipAmount
            
            tipLabel.text = String(format:"$%.2f", tipAmount)
            totalLabel.text = String(format:"$%.2f", totalAmount)
        } else {
            tipLabel.text = ""
            totalLabel.text = ""
        }
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

