//
//  ViewController.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/04.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, AddActivityDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navToAddActivity" {
            let addActivityNavigationController = segue.destination as! UINavigationController
            
            let addActivityViewController = addActivityNavigationController.topViewController as!AddActivityViewController
            
            addActivityViewController.delegate = self
        }
    }
    
    func didAddActivity(activity: Activity) {
        // Add a pin to the map
    }
    
    func defaultName() -> String? {
        return "From Map"
    }
    

}

