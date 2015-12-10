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
    
    var datepicker = UIDatePicker()
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        origin.resignFirstResponder()
        destination.resignFirstResponder()
        date.resignFirstResponder()
        seats.resignFirstResponder()
        price.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.inputView = datepicker
        
        datepicker.addTarget(self, action: "updateTextField:", forControlEvents:.ValueChanged)
        
        // Do any additional setup after loading the view.
    }
    
    func updateTextField (sender: UIDatePicker!) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy hh:mm a"
        let strDate = dateFormatter.stringFromDate(datepicker.date)
        date.text = strDate
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func create(sender: UIButton) {
        
        origin.resignFirstResponder()
        destination.resignFirstResponder()
        date.resignFirstResponder()
        seats.resignFirstResponder()
        price.resignFirstResponder()
        
        if origin.text! == "" || destination.text! == "" || date.text! == "" || seats.text! == "" || price.text! == "" {
            print("Cannot be blank")
            // UIAlertController
            let alertController = UIAlertController(title: nil, message:"Please enter all information to continue.", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)

        }
        else {
            
            let ride = PFObject(className:"rides")
            ride["origin"] = origin.text!
            ride["destination"] = destination.text!
            ride["date"] = date.text!
            ride["seats"] = Int(seats.text!)
            ride["price"] = price.text!
            ride["count"] = 0
            let roleACL = PFACL()
            roleACL.publicReadAccess = true
            roleACL.publicWriteAccess = true
            ride.ACL = roleACL
            ride["driver"] = PFUser.currentUser()!.username
            ride["space"] = Int(seats.text!)
            

            ride.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // UIAlertController
                    let alertController = UIAlertController(title: nil, message:"Successfully created.", preferredStyle:.Alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: {(action) -> Void in
                        self.performSegueWithIdentifier("toMain", sender: nil)
                        
                    })
                    
                    alertController.addAction(defaultAction)
                    self.presentViewController(alertController, animated: true, completion: nil)

            
                    
                    
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
