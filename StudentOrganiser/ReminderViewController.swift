//
//  ReminderViewController.swift
//  StudentOrganiser
//
//  Created by Marcus Hugh on 23/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

