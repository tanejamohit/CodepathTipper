//
//  ViewController.swift
//  Tipper
//
//  Created by Mohit Taneja on 8/14/17.
//  Copyright © 2017 Mohit Taneja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalForTwoLabel: UILabel!
    @IBOutlet weak var totalForThreeLabel: UILabel!
    @IBOutlet weak var totalForFourLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var SupplementDataView: UIView!
    let tipPercentages = [0.18, 0.20, 0.25]
    var lastSavedBillValue = ""
    
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
        if (billField.text?.isEmpty)! {
            billField.text = lastSavedBillValue
        }
        CalculateTip(self)
        animateViewElements()
        billField.becomeFirstResponder()
        billField.placeholder = NSLocale.current.currencySymbol

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        lastSavedBillValue = billField.text!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Hide Keyboard when tapped outside of the editing field
    @IBAction func HideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    func animateViewElements() {
        if (billField.text?.isEmpty)! {
            if SupplementDataView.alpha>0 {
                UIView.animate(withDuration: 0.4, animations: {
                    // This causes SupplementDataView to fade out and move down
                    self.SupplementDataView.alpha=0
                    self.SupplementDataView.frame.origin.y += 100
                    // This will move bill field down too
                    self.billField.frame.origin.y += 20
                })
            }
        }
        else {
            if SupplementDataView.alpha==0 {
                UIView.animate(withDuration: 0.4, animations: {
                    // This causes SupplementDataView to fade out and move down
                    self.SupplementDataView.alpha=1
                    self.SupplementDataView.frame.origin.y -= 100
                    // This will move bill field down too
                    self.billField.frame.origin.y -= 20
                })
            }
        }
    }
    
    // Calculate tip when the bill amount is changed
    @IBAction func CalculateTip(_ sender: Any) {
        animateViewElements()
        let billAmount = Double(billField.text!) ?? 0
        let tipValue = billAmount*tipPercentages[tipController.selectedSegmentIndex]
        
        tipLabel.text = String.init(format: "%@%.2f", NSLocale.current.currencySymbol!, tipValue)
        totalLabel.text = String.init(format: "%@%.2f", NSLocale.current.currencySymbol!, billAmount + tipValue)
        totalForTwoLabel.text = String.init(format: "%@%.2f", NSLocale.current.currencySymbol!, (billAmount + tipValue)/2.0)
        totalForThreeLabel.text = String.init(format: "%@%.2f", NSLocale.current.currencySymbol!, (billAmount + tipValue)/3.0)
        totalForFourLabel.text = String.init(format: "%@%.2f", NSLocale.current.currencySymbol!, (billAmount + tipValue)/4.0)
        
    }
}

