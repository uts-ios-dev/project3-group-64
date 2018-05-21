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
        //getTitles()
        //print("view did load")// NOT LOADING VIEW EACH TIME IT OPENS
    }
    override func viewDidAppear(_ animated: Bool) {
        getTitles()
    }
 
    func getTitles() {
        if userDefaults.stringArray(forKey: "noteTitles") != nil {
            noteTitles = userDefaults.stringArray(forKey: "noteTitles")!
            print(noteTitles.count)
        }else{
       
            print("nope")
        }
        
//        noteTitles.append("Dummy Note one")
//        noteTitles.append("Dummy Note two")
//        noteTitles.append("Dummy Note three")
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
        //prints out 0,1,2
        print("section: \(indexPath.section)")

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "newViewController")
        //self.dismiss(animated: true, completion: nil)
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }

}
