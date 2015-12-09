//
//  LoginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by iGuest on 12/2/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        email.resignFirstResponder()
        password.resignFirstResponder()
    }

    override func viewDidAppear(animated: Bool) {
        
        let currentUser = PFUser.currentUser()
        if currentUser?.username != nil {
            performSegueWithIdentifier("toMain", sender: nil)
        } else {
            print("Not Logged In")
        }
        
        //print("user is \(currentUser?.username)")
        
    }
    
    
    
    @IBAction func login(sender: UIButton) {
        
        email.resignFirstResponder()
        password.resignFirstResponder()
        
        if email.text! == "" || password.text! == "" {
            print("Fields cannot be blank")
            // UIAlertController
            let alertController = UIAlertController(title: nil, message:"Please enter a UW email address and Password to continue.", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
            
        }
        else {
            PFUser.logInWithUsernameInBackground(email.text!, password:password.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    self.performSegueWithIdentifier("toMain", sender: nil)
                } else {
                    print("Invalid credentials")
                    // UIAlertController
                    let alertController = UIAlertController(title: nil, message:"The UW Email ID or Password you entered is incorrect. Please click 'OK' to reenter your UW Email ID and Password.", preferredStyle:.Alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(defaultAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
