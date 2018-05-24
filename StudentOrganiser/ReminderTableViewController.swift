//
//  ReminderTableViewController.swift
//  StudentOrganiser
//
//  Created by Marcus Hugh on 23/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class ReminderTableViewController: UITableViewController {
    
    //My variables
    var reminderTitles:[String] = []
    let userDefaults = Foundation.UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTitles()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getTitles()
    }
    
    func getTitles() {
        if userDefaults.stringArray(forKey: "reminderTitles") != nil {
            reminderTitles = userDefaults.stringArray(forKey: "reminderTitles")!
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return reminderTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderTitleCell", for: indexPath)
        
        let title = reminderTitles[indexPath.section]
        
        
        cell.textLabel?.text = title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.section
        userDefaults.set(index, forKey: "Rindex")
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "NewReminderViewController")
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
}

