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
        if budget == 0.0 {
            budgetLabel.text = "$00.00"
        } else {
            setBudgetLabel()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setBudgetLabel()
        totalExpenses()
        totalFundsLeft()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setBudgetLabel()
        totalExpenses()
        totalFundsLeft()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBudget(_ sender: UIButton) {
        let budgetTemp = Double(budgetTextField.text!)!
        userDefaults.set(budgetTemp, forKey: "budget")
        
        budgetLabel.text = "$" + String(budgetTemp)
        //budget = budgetTemp
        totalFundsLeft()
    }
    
    func totalExpenses() {
//
//        var expenses: Double = 0.0
//        var expDouble: Double = 0.0
//        var expArray: [Double] = []
//
//
//        if userDefaults.stringArray(forKey: "expenseCost") != nil {
//            var expenseCost = userDefaults.stringArray(forKey: "expenseCost")!
//            //expenseCost.remove(at: 0)
//
//            if expenseCost.count >= 0 {
//                for e in expenseCost {
//                    expDouble = Double(e)!
//                    expArray.append(expDouble)
//                    for exp in expArray {
//                        expenses += exp
//                    }
//                    expArray.removeAll()
//                }
//            }
//        }
//
//
//        totalExpense = expenses
//        expensesLabel.text = "$" + String(expenses)
        
        let total: Double = userDefaults.double(forKey: "totalCost")
        expensesLabel.text = "$" + String(total)
        
    }
    
    func setBudgetLabel() {
        let budgetUD: Double = userDefaults.double(forKey: "budget")
        budgetLabel.text = "$" + String(budgetUD)
        
    }
    
    func totalFundsLeft() {
        let total: Double = userDefaults.double(forKey: "totalCost")
        let budgetTot: Double = userDefaults.double(forKey: "budget")
        fundsLeft = budgetTot - total
        fundsLeftLabel.text = "$" + String(fundsLeft)
    }
}
