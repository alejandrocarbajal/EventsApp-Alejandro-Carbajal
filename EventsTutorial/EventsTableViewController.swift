//
//  EventsTableViewController.swift
//  EventsApp
//
//  Created by Alejandro Carbajal on 9/20/18.
//  Copyright © 2018 Alejandro Carbajal. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class EventsTableViewController: PFQueryTableViewController {

    override func queryForTable() -> PFQuery<PFObject> {
        let query = PFQuery(className: "Events")
        //query.order(byAscending: "location")
        query.order(byAscending: "date")
        return query
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.title = "Upcoming Events"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
        
        cell.dateLabel.text = object?.object(forKey: "date") as? String
        cell.locationLabel.text = object?.object(forKey: "location") as? String
        cell.nameLabel.text = object?.object(forKey: "name") as? String
        
        let imageFile = object?.object(forKey: "image") as? PFFile
        
        cell.eventImage.image = UIImage(named: "download")
        
        cell.eventImage.file = imageFile
        cell.eventImage.loadInBackground()
        
        return cell
        
        
    }
    
    @IBAction func reloadTable(_ sender: Any) {
        
        self.loadObjects()
    }


    
    @IBAction func onSignOutTapped(_ sender: Any) {
    }
    

}
