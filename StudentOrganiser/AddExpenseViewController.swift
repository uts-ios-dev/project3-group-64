//
//  AddExpenseViewController.swift
//  StudentOrganiser
//
//  Created by Group 64 on 20/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController {

    @IBOutlet weak var expenseNameTextField: UITextField!
    @IBOutlet weak var expenseCostTextField: UITextField!
    @IBOutlet weak var expenseDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dateChanged(_ sender: UIDatePicker) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let dateString: String = dateFormatter.string(from: sender.date)
        return dateString
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let userDefaults = Foundation.UserDefaults.standard
        
        let expenseName: [String] = [expenseNameTextField.text!]
        let expenseCost: [String] = [expenseCostTextField.text!]
        let expenseDate: [String] = [dateChanged(expenseDatePicker)]
        
        userDefaults.set(expenseName, forKey: "expenseName")
        userDefaults.set(expenseCost, forKey: "expenseCost")
        userDefaults.set(expenseDate, forKey: "expenseDate")
        
    }
    
}
