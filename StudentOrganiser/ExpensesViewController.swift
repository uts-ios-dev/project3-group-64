//
//  ExpensesViewController.swift
//  StudentOrganiser
//
//  Created by Group 64 on 20/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController {

    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var fundsLeftLabel: UILabel!
    @IBOutlet weak var expensesLabel: UILabel!
    @IBOutlet weak var budgetTextField: UITextField!
    var budget: Double = 0.00
    var fundsLeft: Double = 0.00
    var totalExpense: Double = 0.00
    let userDefaults = Foundation.UserDefaults.standard
    var expenseCost: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fundsLeftLabel.text = "$00.00"
        expensesLabel.text = "$00.00"
        budgetLabel.text = "$" + String(budget)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        budgetLabel.text = "$" + String(budget)
        totalExpenses()
        totalFundsLeft()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBudget(_ sender: UIButton) {
        budget = Double(budgetTextField.text!)!
        budgetLabel.text = "$" + String(budget)
        totalFundsLeft()
    }
    
    func totalExpenses() {
        
        var expenses: Double = 0.0
        var expDouble: Double = 0.0
        var expArray: [Double] = []
        
        
        if userDefaults.stringArray(forKey: "expenseCost") != nil {
            var expenseCost = userDefaults.stringArray(forKey: "expenseCost")!
            //expenseCost.remove(at: 0)
            
            if expenseCost.count >= 0 {
                for e in expenseCost {
                    expDouble = Double(e)!
                    expArray.append(expDouble)
                    for exp in expArray {
                        expenses += exp
                    }
                    expArray.removeAll()
                }
            }
        }
        
        
        totalExpense = expenses
        expensesLabel.text = "$" + String(expenses)
        
    }
    
    func totalFundsLeft() {
        
//        if budget != 0 {
            fundsLeft = budget - totalExpense
            fundsLeftLabel.text = "$" + String(fundsLeft)
        //}
        
    }
    
    
    
    
}
