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
        
        if expenseName.count != 0 {
            setValues()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //Gets values from userDefaults --> Array of expenseName + Array of expenseCost + Array of expenseDate
    func setValues() {
        let userDefaults = Foundation.UserDefaults.standard
        
        //highscoreArray = userDefaults.array(forKey: "Record")! as! [Int]
        //usernameArray = userDefaults.stringArray(forKey: "UserName")!
        
        expenseName = userDefaults.stringArray(forKey: "expenseName")!
        expenseCost = userDefaults.stringArray(forKey: "expenseCost")!
        expenseDate = userDefaults.stringArray(forKey: "expenseDate")!

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        
        let name = expenseName[indexPath.section]
        let cost = expenseCost[indexPath.section]
        //let date = expenseCost[indexPath.section]
        
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = String(cost)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
}
