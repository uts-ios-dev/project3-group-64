//
//  NotesFullViewController.swift
//  StudentOrganiser
//
//  Created by Ankush Yamarti on 21/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class NotesFullViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyField: UITextView!
     let userDefaults = Foundation.UserDefaults.standard
    var index = 0
    
    var noteTitles:[String] = []
    var noteBodys:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        titleLabel.text = noteTitles[index]
        bodyField.text = noteBodys[index]
        
        for i in 0...noteBodys.count-1 {
            print("index \(i) : \(noteBodys[i])")
        }
        
        // Do any additional setup after loading the view.
    }
    
    func getData(){
        if userDefaults.stringArray(forKey: "noteTitles") != nil {
            noteTitles = userDefaults.stringArray(forKey: "noteTitles")!
        }
        if userDefaults.stringArray(forKey: "noteBodys") != nil {
            noteBodys = userDefaults.stringArray(forKey: "noteBodys")!
        }
        index = userDefaults.integer(forKey: "index")
        
    }
    @IBAction func SaveNote(_ sender: UIButton) {
        noteTitles[index] = titleLabel.text!
        noteBodys[index] = bodyField.text
        
        userDefaults.set(noteTitles, forKey: "noteTitles")
        userDefaults.set(noteBodys, forKey: "noteBodys")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BackButton(_ sender: UIButton) {
          self.dismiss(animated: true, completion: nil)
    }
}
