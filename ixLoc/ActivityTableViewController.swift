//
//  ActivityTableViewController.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/04.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class ActivityTableViewController: UITableViewController, AddActivityDelegate {

    var activities: [ActivityDto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Get the default Realm
        let realm = try! Realm()
        let acts = realm.objects(Activity.self)
        
        for act in acts {
            activities.append(ActivityDto(name: act.name, description: act.descr))
        }
        
        tableView.reloadData()
        
        /*
        Alamofire.request("https://ixlocation.firebaseio.com/activities.json").responseJSON(completionHandler: {
            response in
            //print(response.result.value)
            
            if let activityDictionary = response.result.value as? [String: AnyObject] {
                
                //self.activities = []
                
                for (key, value) in activityDictionary {
                    print("Key: \(key)")
                    print("Value: \(value)")
                    
                    if let singleActivityDictionary = value as? [String: AnyObject] {
                        let activity = ActivityDto(dictionary: singleActivityDictionary)
                        self.activities.append(activity)
                        self.tableView.reloadData()
                    }
                }
                
            }
        })
        */
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) //as! ActivityTableViewCell

        // Configure the cell...
        cell.textLabel?.text = activities[indexPath.row].name
        cell.detailTextLabel?.text = activities[indexPath.row].description
        
        if let image = activities[indexPath.row].image {
            cell.imageView?.image = image
        }
        
        //cell.name.text = activities[indexPath.row].name
        //cell.descriptionLabel.text = activities[indexPath.row].description
        //cell.latitude.text = "\(activities[indexPath.row].latitude)"
        //cell.longitude.text = "\(activities[indexPath.row].longitude)"

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navToAddActivity" {
            let addActivityNavigationController = segue.destination as! UINavigationController
            
            let addActivityViewController = addActivityNavigationController.topViewController as!AddActivityViewController
            
            addActivityViewController.delegate = self
        }
    }
    
    func addActivity(activity: ActivityDto) {
        self.activities.append(activity)
        self.tableView?.reloadData()
    }
    
    func didAddActivity(activity: ActivityDto) {
        self.activities.append(activity)
        self.tableView?.reloadData()
    }
    
    func defaultName() -> String? {
        return "Hello"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
