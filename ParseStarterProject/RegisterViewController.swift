//
//  RegisterViewController.swift
//  ParseStarterProject-Swift
//
//  Created by iGuest on 12/2/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        email.resignFirstResponder()
        password.resignFirstResponder()
        confirmPassword.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func submit(sender: UIButton) {
        
        email.resignFirstResponder()
        password.resignFirstResponder()
        confirmPassword.resignFirstResponder()
        
        if email.text! == "" {
            print("email cannot be blank")
            // UIAlertController
            let alertController = UIAlertController(title: nil, message:"Please enter a UW email address to continue.", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)

        }
            
        else if !email.text!.hasSuffix("@uw.edu") {
            print("not uw email")
            // UIAlertController
            let alertController = UIAlertController(title: nil, message:"The email address is not valid. Please enter a valid UW email address.", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
            
        }
            
        else if password.text == "" || confirmPassword == "" {
            print("password cannot be blank")
            // UIAlertController
            let alertController = UIAlertController(title: nil, message:"Please enter a password to continue.", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
            
        }
        else if password.text! != confirmPassword.text! {
            print("passwords do not match")
            // UIAlertController
            let alertController = UIAlertController(title: nil, message:"Your passwords don't match. Please reenter your password to confirm it.", preferredStyle:.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        
        else {
                let user = PFUser()
                user.username = email.text!
                user.password = password.text!
                user.email = email.text!
                user["ridelist"] = [String]()
                
                user.signUpInBackgroundWithBlock {
                    (succeeded: Bool, error: NSError?) -> Void in
                    if let error = error {
                        let errorString = error.userInfo["error"] as? NSString
                        let alertController = UIAlertController(title: nil, message:"Your account already exists.", preferredStyle:.Alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                        alertController.addAction(defaultAction)
                        self.presentViewController(alertController, animated: true, completion: nil)
                        print(errorString)
                    } else {
                        PFUser.logOutInBackgroundWithBlock{ (error) -> Void in
                            if let _ = error {
                                print("log out didnt work")
                            }else {
                                let alertController = UIAlertController(title: nil, message:" Successfully registered.", preferredStyle:.Alert)
                                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: {(action) -> Void in
                                    self.performSegueWithIdentifier("toLogin", sender: nil)
                                
                            })

                                alertController.addAction(defaultAction)
                                self.presentViewController(alertController, animated: true, completion: nil)
                            }
                        }
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
