//
//  ExpenseListTableViewController.swift
//  StudentOrganiser
//
//  Created by Group 64 on 20/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class ExpenseListTableViewController: UITableViewController {

    var expenseName: [String] = []
    var expenseCost: [String] = []
    var expenseDate: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //I put the test for empty arrays in the setValues function
        setValues()
        //so you dont need this stuff below
//        if expenseName.count != 0 {
//            setValues()
//            print(expenseName)
//        }
        print(expenseName)
    }
    //Had to add this so that it updates immeadiatly, the view doesnt actually load again when you go from the add exspense page back to budget planner
    override func viewDidAppear(_ animated: Bool) {
        setValues()
    }
    
    //Gets values from userDefaults --> Array of expenseName + Array of expenseCost + Array of expenseDate
    func setValues() {
        let userDefaults = Foundation.UserDefaults.standard
        
        if userDefaults.stringArray(forKey: "expenseName") != nil {
            expenseName = userDefaults.stringArray(forKey: "expenseName")!
        }
        
        if userDefaults.stringArray(forKey: "expenseCost") != nil {
            expenseCost = userDefaults.stringArray(forKey: "expenseCost")!
        }
        
        if userDefaults.stringArray(forKey: "expenseDate") != nil {
            expenseDate = userDefaults.stringArray(forKey: "expenseDate")!
        }
        //Refreshes the table when viewed
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return expenseName.count //This was one, i switched it to the count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //this was the count  i switched it with one (the two were mixed up)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)//I added the identifier in the table. called it "expenseCell", without it it wont display the stuff.
        
        let name = expenseName[indexPath.section]
        let cost = expenseCost[indexPath.section]
        //let date = expenseCost[indexPath.section]
        
        //Added the text label in the table and the detail label.
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = String(cost)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
}
