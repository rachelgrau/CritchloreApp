/**
WelcomeViewController
=====================
View Controller that controls the log in and sign up screen.
Has a view that contains 2 textfields and 2 buttons.
By default, assumes the user is in login "mode"
The user can switch to sign up "mode" by pressing the second button.
We use the same buttons/textfields for both modes, just change the titles.
 
Created by Rachel on 8/26/16.
Copyright © 2016 Rachel. All rights reserved.
*/

import UIKit

class WelcomeViewController: UIViewController {

    /* If in log in mode, this is the "log in" button. If in sign up mode, it's the "sign up button */
    @IBOutlet var mainButton: UIButton!
    
    /* If in log in mode, this is the "Need an account? Sign up" button. If in sign up mode, it's the "Already have an account? Log in" button */
    @IBOutlet var switchModeButton: UIButton!
    
    /* Text field to enter email. */
    @IBOutlet var emailTextField: UITextField!
    
    /* Text field to enter password. */
    @IBOutlet var passwordTextField: UITextField!
    
    /* Keep track of whether we are displaying log in or sign up mode */
    private var isInLogInMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isInLogInMode = true
    }
    
    /* If in log in mode, attempt log in. If in sign up mode, attempt sign up. */
    @IBAction func mainButtonPressed(sender: AnyObject) {
        let email = emailTextField.text
        let password = passwordTextField.text
        print("Email: " + email!)
        print ("Password: " + password!)
        
        if (isInLogInMode) {
            print("Attempting log in")
        } else {
            print("Attempting sign up")
        }
    }
    
    /* Switch modes and update texts of buttons. */
    @IBAction func switchModeButtonPressed(sender: AnyObject) {
        isInLogInMode = !isInLogInMode
        
        if (isInLogInMode) {
            mainButton.setTitle("log in", forState:UIControlState.Normal)
            switchModeButton.setTitle("Need an account? Sign up", forState: UIControlState.Normal)
        } else {
            mainButton.setTitle("sign up", forState:UIControlState.Normal)
            switchModeButton.setTitle("Already have an account? Log in", forState: UIControlState.Normal)
        }
    }
}
