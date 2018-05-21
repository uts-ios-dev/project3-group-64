//
//  NotesFullViewController.swift
//  StudentOrganiser
//
//  Created by Ankush Yamarti on 21/5/18.
//  Copyright © 2018 Jacob Brennan. All rights reserved.
//

import UIKit

class NotesFullViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BackButton(_ sender: UIButton) {
          self.dismiss(animated: true, completion: nil)
    }
}
