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
import RealmSwift

class AddActivityViewController: UIViewController, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
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

    @IBAction func selectImage(_ sender: Any) {
        // Image picker
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        imagePickerController.sourceType = .savedPhotosAlbum
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        self.selectedImage.image = selectedImage
        self.selectImageButton.isHidden = true
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        let activity = Activity()
        activity.name = nameTextField.text!
        activity.descr = descriptionTextView.text
        
        // Get the default Realm
        let realm = try! Realm()
        // You only need to do this once (per thread)
        
        // Add to the Realm inside a transaction
        try! realm.write {
            realm.add(activity)
        }
        
        print(realm.configuration.fileURL)
        
        var activityDto: ActivityDto?
        
        if let location = self.latestLocation {
            activityDto = ActivityDto(name: nameTextField.text, description: descriptionTextView.text, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        } else {
            activityDto = ActivityDto(name: nameTextField.text, description: descriptionTextView.text)
        }
        
        Alamofire.request("https://ixlocation.firebaseio.com/activities.json", method: .post, parameters: activityDto?.toJSON(), encoding: JSONEncoding.default).responseJSON(completionHandler: {response in
            
            switch response.result {
            case .success:
                self.delegate?.didAddActivity(activity: activityDto!)
                self.dismiss(animated: true, completion: nil)
                break
            case .failure:
                // TODO: Display an error dialog
                break
            }
            
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.latestLocation = locations[0]
        
    }

}
