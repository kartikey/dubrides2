//
//  OfferRidesViewController.swift
//  ParseStarterProject-Swift
//
//  Created by iGuest on 12/2/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class OfferRidesViewController: UIViewController {

    @IBOutlet weak var origin: UITextField!
    @IBOutlet weak var destination: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var seats: UITextField!
    @IBOutlet weak var price: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func create(sender: UIButton) {
        
        if origin.text! == "" || destination.text! == "" || date.text! == "" || seats.text! == "" || price.text! == "" {
            print("Cannot be blank")
        }
        else {
            
            let ride = PFObject(className:"rides")
            ride["origin"] = origin.text!
            ride["destination"] = destination.text!
            ride["date"] = date.text!
            ride["seats"] = Int(seats.text!)
            ride["price"] = price.text!
            ride["count"] = 0
            //ride["driver"] = currentUser?.username
            

            ride.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    self.performSegueWithIdentifier("toMain", sender: nil)
                } else {
                    print(error?.description)
                }
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
