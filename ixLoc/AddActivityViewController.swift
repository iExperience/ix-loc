//
//  AddActivityViewController.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/04.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

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
        
        Alamofire.request("https://ixlocation.firebaseio.com/activities.json", method: .post, parameters: activity?.toJSON(), encoding: JSONEncoding.default).responseJSON(completionHandler: {response in
            
            switch response.result {
            case .success:
                self.delegate?.didAddActivity(activity: activity!)
                self.dismiss(animated: true, completion: nil)
                break
            case .failure:
                // TODO: Display an error dialog
                break
            }
            
        })
            
        /*
        delegate?.didAddActivity(activity: activity!)
        self.dismiss(animated: true, completion: nil)
        */
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.latestLocation = locations[0]
        
    }

}
