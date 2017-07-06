//
//  AddActivityViewController.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/04.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import UIKit
import MapKit

class AddActivityViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var delegate: AddActivityDelegate?
    
    let locationManager: CLLocationManager = CLLocationManager()
    var latestLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultName = delegate?.defaultName()
        nameTextField.text = defaultName
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        //locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        var activity: Activity?
        
        if let location = self.latestLocation {
            activity = Activity(name: nameTextField.text, description: descriptionTextView.text, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        } else {
            activity = Activity(name: nameTextField.text, description: descriptionTextView.text)
        }
        
        delegate?.didAddActivity(activity: activity!)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.latestLocation = locations[0]
        
    }

}
