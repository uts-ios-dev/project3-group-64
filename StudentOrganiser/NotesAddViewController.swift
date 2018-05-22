//
//  NotesAddViewController.swift
//  StudentOrganiser
//
//  Created by Ankush Yamarti on 21/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class NotesAddViewController: UIViewController {

    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteBody: UITextView!
    
     var noteTitles:[String] = []
     var noteBodys:[String] = []
    
    let userDefaults = Foundation.UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefaults.stringArray(forKey: "noteTitles") != nil {
            noteTitles = userDefaults.stringArray(forKey: "noteTitles")!
        }
        
        if userDefaults.stringArray(forKey: "noteBodys") != nil {
            noteBodys = userDefaults.stringArray(forKey: "noteBodys")!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func AddNote(_ sender: UIButton) {
       
        let title = noteTitle.text!
        let body = noteBody.text!
     
        noteTitles.append(title)
        noteBodys.append(body)
        
        userDefaults.set(noteTitles, forKey: "noteTitles")
        userDefaults.set(noteBodys, forKey: "noteBodys")
      
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func BackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }


}
