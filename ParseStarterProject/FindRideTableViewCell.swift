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
