//
//  SettingsViewController.swift
//  tips
//
//  Created by Sean Crenshaw on 12/7/15.
//  Copyright © 2015 Sean Crenshaw. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intvalue = defaults.integerForKey("testuser");
        defaultTipField.text = String(intvalue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipDef:Int? = Int(defaultTipField.text!)
        defaults.setInteger(tipDef!, forKey: "testuser")
        defaults.synchronize()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
