//
//  ViewController.swift
//  Tipper
//
//  Created by Mohit Taneja on 8/14/17.
//  Copyright © 2017 Mohit Taneja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    let tipPercentages = [0.18, 0.20, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        // Set the default tip percentage previously saved
        let defaults = UserDefaults.standard
        let tipPercentage = defaults.double(forKey: "tipper.tip_percentage")
        if tipPercentage > 0 {
            tipController.selectedSegmentIndex = tipPercentages.index(of: tipPercentage) ?? 0
        }
        CalculateTip(self)
        billField.becomeFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Hide Keyboard when tapped outside of the editing field
    @IBAction func HideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    // Calculate tip when the bill amount is changed
    @IBAction func CalculateTip(_ sender: Any) {
        let billAmount = Double(billField.text!) ?? 0
        let tipValue = billAmount*tipPercentages[tipController.selectedSegmentIndex]
        
        tipLabel.text = String.init(format: "$%.2f", tipValue)
        totalLabel.text = String.init(format: "$%.2f", billAmount + tipValue)
        
    }
}

