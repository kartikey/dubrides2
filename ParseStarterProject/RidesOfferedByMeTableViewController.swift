//
//  TestTableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by iGuest on 12/4/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class RidesOfferedByMeTableViewController : PFQueryTableViewController {
    
    override init(style: UITableViewStyle, className: String?) {
        super.init(style: style, className: className)
        parseClassName = "rides"
        pullToRefreshEnabled = true
        paginationEnabled = true
        objectsPerPage = 25
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        parseClassName = "rides"
        pullToRefreshEnabled = true
        paginationEnabled = true
        objectsPerPage = 25
    }
    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: self.parseClassName!)
        
        query.whereKey("driver", equalTo: PFUser.currentUser()!.username!)
        
        query.orderByDescending("createdAt")
        
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier = "myridecell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? RidesOfferedByMeTableViewCell
        //        if cell == nil {
        //            cell = PFTableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        //        }
        
        // Configure the cell to show todo item with a priority at the bottom
        if let object = object {
            cell!.to.text = "To:" + (object["destination"] as? String)!
            cell!.from.text = "From:" + (object["origin"] as? String)!
            cell!.date.text = "Date:" + (object["date"] as? String)!
            cell!.price.text = "Price:" + (object["price"] as? String)!
            cell!.seats.text = "Seats:" + String(object["count"]! as! NSNumber) + "/" + String(object["seats"]! as! NSNumber)
            
            cell!.rideid = object.objectId!
            cell!.index = indexPath
            
        }
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

}
