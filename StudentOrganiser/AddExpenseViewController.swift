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
    
    @IBOutlet weak var saveButton: UIButton!
    
    var expenseName: [String] = []
    var expenseCost: [String] = []
    var expenseDate: [String] = []
    let userDefaults = Foundation.UserDefaults.standard
        
    override func viewDidLoad() {
        super.viewDidLoad()

        if userDefaults.stringArray(forKey: "expenseName") != nil {
            expenseName = userDefaults.stringArray(forKey: "expenseName")!
        }
        
        if userDefaults.stringArray(forKey: "expenseCost") != nil {
            expenseCost = userDefaults.stringArray(forKey: "expenseCost")!
        }
        
        if userDefaults.stringArray(forKey: "expenseDate") != nil {
            expenseDate = userDefaults.stringArray(forKey: "expenseDate")!
        }
        
        saveButton.layer.cornerRadius = 5
        
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
    
    //Set user defaults for total costs
    func totalCosts(s : String) {
        let newCost: Double = Double(s)!
        let oldTotal: Double = userDefaults.double(forKey: "totalCost")
        
        let updatedTotal: Double = oldTotal + newCost
        userDefaults.set(updatedTotal, forKey: "totalCost")
    }
        
    @IBAction func saveButton(_ sender: UIButton) {
      
        let name = expenseNameTextField.text!
        let cost = expenseCostTextField.text!
        let date = dateChanged(expenseDatePicker)
        
        expenseName.append(name)
        expenseCost.append(cost)
        expenseDate.append(date)
       
        userDefaults.set(expenseName, forKey: "expenseName")
        userDefaults.set(expenseCost, forKey: "expenseCost")
        userDefaults.set(expenseDate, forKey: "expenseDate")
        totalCosts(s: cost)
    }
    
}
