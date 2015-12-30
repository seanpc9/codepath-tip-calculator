//
//  ViewController.swift
//  tips
//
//  Created by Sean Crenshaw on 11/30/15.
//  Copyright © 2015 Sean Crenshaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sliderControl: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var totalBackgroundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.becomeFirstResponder()
        
        self.view.backgroundColor = UIColor.darkGrayColor()
        totalBackgroundLabel.backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1)
        self.view.sendSubviewToBack(totalBackgroundLabel)
        billField.keyboardAppearance = UIKeyboardAppearance.Dark
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intvalue = defaults.integerForKey("testuser");
        sliderControl.value = Float(intvalue)
        sliderLabel.text = String(intvalue) + " %"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        
        let selectedValue = Int(sliderControl.value)
        let tipPercentage = Double(selectedValue) / 100.0
        
        sliderLabel.text = String(selectedValue) + " %"
        
        let billText = billField.text?.stringByReplacingOccurrencesOfString("$", withString: "")
        let billAmount = NSString(string: billText!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onEditingBegin(sender: AnyObject) {
        billField.text = "$"
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let selectedValue = Int(sliderControl.value)
        let tipPercentage = Double(selectedValue) / 100.0
        let billText = billField.text?.stringByReplacingOccurrencesOfString("$", withString: "")
        let billAmount = NSString(string: billText!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
}

