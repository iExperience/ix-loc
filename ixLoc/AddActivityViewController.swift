//
//  AddActivityViewController.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/04.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var activityTableViewController: ActivityTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        let activity = Activity(name: nameTextField.text, description: descriptionTextView.text)
        
        activityTableViewController?.activities.append(activity)
        activityTableViewController?.tableView?.reloadData()
        
        self.dismiss(animated: true, completion: nil)
    }

}
