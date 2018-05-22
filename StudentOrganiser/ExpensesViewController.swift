//
//  ExpensesViewController.swift
//  StudentOrganiser
//
//  Created by Group 64 on 20/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController {

    @IBOutlet weak var fundsLeftLabel: UILabel!
    @IBOutlet weak var expensesLabel: UILabel!
    @IBOutlet weak var budgetTextField: UITextField!
    var budget: Double = 0.0
    var fundsLeft: Double = 0.0
    var totalExpense: Double = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fundsLeftLabel.text = "$00.00"
        expensesLabel.text = "$00.00"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        totalExpenses()
        totalFundsLeft()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBudget(_ sender: UIButton) {
        budget = Double(budgetTextField.text!)!
    }
    
    func totalExpenses() {
        let userDefaults = Foundation.UserDefaults.standard
        
        let newExpense: Double = userDefaults.double(forKey: "cost")
        totalExpense = totalExpense + newExpense
        expensesLabel.text = "$" + String(totalExpense)
    }
    
    func totalFundsLeft() {
        let budgetDouble: Double = budget
        
        if budgetDouble != 0 {
            fundsLeft = budgetDouble - totalExpense
            fundsLeftLabel.text = "$" + String(fundsLeft)
        }
        
    }
    
    
    
    
}
