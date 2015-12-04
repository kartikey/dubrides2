//
//  MainMenuViewController.swift
//  ParseStarterProject-Swift
//
//  Created by iGuest on 12/2/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let button = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: "logout:")
        
        self.navigationItem.rightBarButtonItem = button
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logout(sender: UIBarButtonItem) {
        PFUser.logOutInBackgroundWithBlock {(error) -> Void in
            
            if let _ = error {
                
                print("log out did not work")
                
            } else {
                
                self.performSegueWithIdentifier("toLogin", sender: nil)
                
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
