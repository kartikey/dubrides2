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

class TestTableViewController : PFQueryTableViewController {
    
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
        
        // If no objects are loaded in memory, we look to the cache first to fill the table
        // and then subsequently do a query against the network.
//        if self.objects!.count == 0 {
//            query.cachePolicy = .CacheThenNetwork
//        }
//        if [self.objects].count == 0 {
//            
//            query.cachePolicy = PFCachePolicy.CacheThenNetwork
//            
//        }
        
        query.orderByDescending("createdAt")
        
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cellIdentifier = "findridecell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? FindRideTableViewCell
//        if cell == nil {
//            cell = PFTableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
//        }
        
        // Configure the cell to show todo item with a priority at the bottom
        if let object = object {
            cell!.to.text = object["destination"] as? String
            cell!.from.text = object["orign"] as? String
            cell!.date.text = object["date"] as? String
            cell!.price.text = object["price"] as? String
            cell!.seats.text = object["seats"] as? String
        }
        
        return cell
    }
}
