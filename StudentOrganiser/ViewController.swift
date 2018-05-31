//
//  ViewController.swift
//  StudentOrganiser
//
//  Created by Group 64 on 14/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var budgetPlanButton: UIButton!
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        budgetPlanButton.layer.cornerRadius = 5
        notesButton.layer.cornerRadius = 5
        reminderButton.layer.cornerRadius = 5
        resetButton.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetUserDefaults(_ sender: UIButton) {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
    }
}

