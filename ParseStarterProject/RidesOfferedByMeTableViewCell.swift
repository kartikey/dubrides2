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
     
        // UIAlertController
        let alertController = UIAlertController(title: nil, message:"Are you sure you want to delete the ride?", preferredStyle:.Alert)
        let NoAction = UIAlertAction(title: "No", style: .Default, handler: nil)
        alertController.addAction(NoAction)
        let YesAction = UIAlertAction(title: "Yes", style: .Destructive, handler: {(action) -> Void in
            let query = PFQuery(className:"rides")
            query.getObjectInBackgroundWithId(self.rideid!) {
                (ride: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let ride = ride {
                    
                    ride.deleteInBackground()
                    self.removeFromSuperview()
                    
                }
            }
            
        })
        alertController.addAction(YesAction)
        self.window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)


        
       
        
    }
    
    
    
}
