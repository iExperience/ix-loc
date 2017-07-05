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
    
    var delegate: AddActivityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultName = delegate?.defaultName()
        nameTextField.text = defaultName
    }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        let activity = Activity(name: nameTextField.text, description: descriptionTextView.text)
        
        delegate?.didAddActivity(activity: activity)
        
        //activityTableViewController?.addActivity(activity: activity)
        //mapViewController.addActivity(activity: activity)
        
        self.dismiss(animated: true, completion: nil)
    }

}
