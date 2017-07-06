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
    
    var activity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // Hardcoded instance of an Activity
        self.activity = Activity(name: "Test", description: "Test", latitude: -33.918861, longitude: 18.423300)
        
        // Instantiate a new Coordinate
        let coordinate = CLLocationCoordinate2D(latitude: (activity?.latitude!)!, longitude: (activity?.longitude!)!)
        
        // Instantiate a new Point
        let point = MKPointAnnotation()
        point.coordinate = coordinate
        point.title = self.activity?.name
        
        // Add the point to the map
        map.addAnnotation(point)
         */
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
        // Instantiate a new Coordinate
        let coordinate = CLLocationCoordinate2D(latitude: activity.latitude!, longitude: activity.longitude!)
        
        // Instantiate a new Point
        let point = MKPointAnnotation()
        point.coordinate = coordinate
        point.title = activity.name
        
        // Add the point to the map
        map.addAnnotation(point)
    }
    
    func defaultName() -> String? {
        return "From Map"
    }
    

}

