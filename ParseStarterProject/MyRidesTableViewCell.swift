//
//  FindRideTableViewCell.swift
//  ParseStarterProject-Swift
//
//  Created by iGuest on 12/2/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MyRidesTableViewCell: PFTableViewCell {
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var seats: UILabel!
    var rideid: String?
    

    @IBAction func leave(sender: UIButton) {
        
        let view = self.superview?.superview
        
        let tableView = view as! UITableView
        
        let query = PFQuery(className:"rides")
        query.getObjectInBackgroundWithId(rideid!) {
            (ride: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let ride = ride {
                if ride["count"]! as! NSNumber == 0 {
                    print("Ride is empty")
                    tableView.reloadData()
                }
                else {
                    ride.incrementKey("count", byAmount: -1)
                    ride.saveInBackgroundWithBlock {
                        (success: Bool, error: NSError?) -> Void in
                        if (success) {
                            
                            
                            let currentuser = PFUser.currentUser()
                            currentuser?.removeObject(self.rideid!, forKey: "ridelist")
                            
                            
                            currentuser!.saveInBackgroundWithBlock {
                                (success: Bool, error: NSError?) -> Void in
                                if (success) {
                                    print("success")
                                    tableView.reloadData()
                                } else {
                                    print(error?.description)
                                }
                            }
                            
                            
                            
                        } else {
                            print(error)
                        }
                    }
                }
            }
        }
        
    }
    
    
    
}
