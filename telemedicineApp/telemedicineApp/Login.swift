//
//  ViewController.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/24/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit
import Parse
class Login: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBAction func loginFunc(_ sender: Any) {
        if (usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            let missingFieldAlert = UIAlertController(title: "Missing Information", message: "Please fill all missing information", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            missingFieldAlert.addAction(ok)
            self.present(missingFieldAlert, animated: true, completion: nil)
        }
        
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
            if error == nil {
                //saves the username is memory
                UserDefaults.standard.set(user!.username, forKey: "name")
                UserDefaults.standard.synchronize()
                //what does this do?
                let appDelegate: AppDelegate =  UIApplication.shared.delegate as! AppDelegate
                appDelegate.login()
            }
        }
    }
    
    
    @IBAction func signUpFunc(_ sender: Any) {
    }
    
}

