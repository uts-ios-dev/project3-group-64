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
    
    //Putting your variables up here so I can access them from both viewdidload and savebutton
    var expenseName: [String] = []
    var expenseCost: [String] = []
    var expenseDate: [String] = []
    let userDefaults = Foundation.UserDefaults.standard
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //Gets the arrays data only if they have data in it. This makes sure youre adding to the saved data rather than rewriting it.
        if userDefaults.stringArray(forKey: "expenseName") != nil {
            expenseName = userDefaults.stringArray(forKey: "expenseName")!
        }
        
        if userDefaults.stringArray(forKey: "expenseCost") != nil {
            expenseCost = userDefaults.stringArray(forKey: "expenseCost")!
        }
        
        if userDefaults.stringArray(forKey: "expenseDate") != nil {
            expenseDate = userDefaults.stringArray(forKey: "expenseDate")!
        }
        
//        if (expenseNameTextField.text?.isEmpty)! && (expenseCostTextField.text?.isEmpty)! {
//            saveButton.isUserInteractionEnabled = false
//        }
        //
        
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
      
        //I dont know why but you have to do it like this. Seperately.
        let name = expenseNameTextField.text!
        let cost = expenseCostTextField.text!
        let date = dateChanged(expenseDatePicker)
        
        //Appending instead of setting the fist value.
        expenseName.append(name)
        expenseCost.append(cost)
        expenseDate.append(date)
       
        userDefaults.set(expenseName, forKey: "expenseName")
        userDefaults.set(expenseCost, forKey: "expenseCost")
        userDefaults.set(expenseDate, forKey: "expenseDate")
        totalCosts(s: cost)
    }
    
}
