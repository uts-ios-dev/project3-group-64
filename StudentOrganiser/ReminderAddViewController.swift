//
//  ReminderAddViewController.swift
//  StudentOrganiser
//
//  Created by Marcus Hugh on 23/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class ReminderAddViewController: UIViewController {
    
    @IBOutlet weak var reminderTitle: UITextField!
    @IBOutlet weak var reminderBody: UITextView!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var reminderDate: UIDatePicker!
    
    var reminderTitles:[String] = []
    var reminderBodys:[String] = []
    var reminderDates = NSDate()
    
    @IBAction func dateSwitchOn(_ sender: UISwitch) {
        if reminderSwitch.isOn {
            reminderDate.alpha = 1
        } else {
            reminderDate.alpha = 0
        }
    }
    
    
    let userDefaults = Foundation.UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefaults.stringArray(forKey: "reminderTitles") != nil {
            reminderTitles = userDefaults.stringArray(forKey: "reminderTitles")!
        }
        
        if userDefaults.stringArray(forKey: "reminderBodys") != nil {
            reminderBodys = userDefaults.stringArray(forKey: "reminderBodys")!
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func AddReminder(_ sender: UIButton) {
        
        let title = reminderTitle.text!
        let body = reminderBody.text!
        
        reminderTitles.append(title)
        reminderBodys.append(body)
        
        userDefaults.set(reminderTitles, forKey: "reminderTitles")
        userDefaults.set(reminderBodys, forKey: "reminderBodys")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func BackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

