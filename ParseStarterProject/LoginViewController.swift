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
        
        if email.text! == "" || password.text! == "" {
            print("Fields cannot be blank")
        }
        else {
            PFUser.logInWithUsernameInBackground(email.text!, password:password.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    self.performSegueWithIdentifier("toMain", sender: nil)
                } else {
                    print("Invalid credentials")
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
