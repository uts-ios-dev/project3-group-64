//
//  ReminderFullViewController.swift
//  StudentOrganiser
//
//  Created by Marcus Hugh on 23/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class ReminderFullViewController: UIViewController {
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyField: UITextView!
    @IBOutlet weak var deleteNoteButton: UIButton!
    @IBOutlet weak var saveChangesButton: UIButton!
    let userDefaults = Foundation.UserDefaults.standard
    var index = 0
    
    var reminderTitles:[String] = []
    var reminderBodys:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        deleteNoteButton.layer.cornerRadius = 5
        saveChangesButton.layer.cornerRadius = 5
        
        titleLabel.text = reminderTitles[index]
        bodyField.text = reminderBodys[index]
    }
    
    func getData(){
        if userDefaults.stringArray(forKey: "reminderTitles") != nil {
            reminderTitles = userDefaults.stringArray(forKey: "reminderTitles")!
        }
        if userDefaults.stringArray(forKey: "reminderBodys") != nil {
            reminderBodys = userDefaults.stringArray(forKey: "reminderBodys")!
        }
        
        index = userDefaults.integer(forKey: "Rindex")

    }
    @IBAction func SaveReminder(_ sender: UIButton) {
        reminderTitles[index] = titleLabel.text!
        reminderBodys[index] = bodyField.text
        
        userDefaults.set(reminderTitles, forKey: "reminderTitles")
        userDefaults.set(reminderBodys, forKey: "reminderBodys")
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func DeleteButton(_ sender: UIButton) {
        
        reminderTitles.remove(at: index)
        reminderBodys.remove(at: index)
        
        userDefaults.set(reminderTitles, forKey: "reminderTitles")
        userDefaults.set(reminderBodys, forKey: "reminderBodys")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

