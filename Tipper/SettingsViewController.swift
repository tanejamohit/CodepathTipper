//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Mohit Taneja on 8/14/17.
//  Copyright © 2017 Mohit Taneja. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipController: UISegmentedControl!
    let tipPercentages = [0.18, 0.20, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        loadSavedTipPercentage()
    }
    
    func loadSavedTipPercentage() {
        // Set the default tip percentage previously saved
        let defaults = UserDefaults.standard
        let tipPercentage = defaults.double(forKey: "tipper.tip_percentage")
        if tipPercentage > 0 {
            tipController.selectedSegmentIndex = tipPercentages.index(of: tipPercentage) ?? 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func SaveTipDefaultPercentage(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipPercentages[tipController.selectedSegmentIndex], forKey: "tipper.tip_percentage")
        defaults.synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
