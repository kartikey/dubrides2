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

class FindRideTableViewCell: PFTableViewCell {
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var seats: UILabel!
    var rideid: String?

    @IBAction func join(sender: UIButton) {
        
        var query = PFQuery(className:"rides")
        query.getObjectInBackgroundWithId(rideid!) {
            (ride: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let ride = ride {
                if ride["seats"] as? NSNumber == ride["count"] as? NSNumber {
                    print("Ride is full")
                }
                else {
                    ride.incrementKey("seats")
                    ride.saveInBackgroundWithBlock {
                        (success: Bool, error: NSError?) -> Void in
                        if (success) {
                            
                            
//                            var currentuser = PFUser.currentUser()
//                            var temparray = [String]()
//                            temparray.append(self.rideid!)
//                            currentuser!.addUniqueObjectsFromArray(temparray, forKey:"ridelist")
//                            currentuser!.saveInBackground()
//                            
                            
                            
                            
                            
                            
                            print("added to ride")
                        } else {
                            print(error)
                        }
                    }
                }
            }
        }
        
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
