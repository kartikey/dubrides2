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

class RidesOfferedByMeTableViewCell: PFTableViewCell {
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var seats: UILabel!
    var rideid: String?
    var index: NSIndexPath?
    
    
    @IBAction func delRide(sender: UIButton) {
        let view = self.superview?.superview
        
        let tableView = view as! UITableView
        
        

        
        let query = PFQuery(className:"rides")
        query.getObjectInBackgroundWithId(rideid!) {
            (ride: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let ride = ride {
                
                ride.deleteInBackground()
                tableView.deleteRowsAtIndexPaths([self.index!], withRowAnimation: .Fade)
            
            
            }
        }
        
    }
    
    
    
}
