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
        
        if email.text! == "" || password.text == "" || confirmPassword == "" {
            print("Cannot be blank")
        }
        else if password.text! != confirmPassword.text! {
            print("passwords do not match")
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
                    print(errorString)
                } else {
                    PFUser.logOutInBackgroundWithBlock{ (error) -> Void in
                        if let _ = error {
                            print("log out didnt work")
                        }else {
                            self.performSegueWithIdentifier("toLogin", sender: nil)
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
