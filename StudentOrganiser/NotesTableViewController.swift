//
//  NotesTableViewController.swift
//  StudentOrganiser
//
//  Created by Ankush Yamarti on 21/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    //My variables
    var noteTitles:[String] = []
    let userDefaults = Foundation.UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTitles()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getTitles()
    }
    
    //Gets note titles
    func getTitles() {
        if userDefaults.stringArray(forKey: "noteTitles") != nil {
            noteTitles = userDefaults.stringArray(forKey: "noteTitles")!
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return noteTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteTitleCell", for: indexPath)

        let title = noteTitles[indexPath.section]
        
        cell.textLabel?.text = title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.section
        userDefaults.set(index, forKey: "index")
        

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "newViewController")

        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }

}
