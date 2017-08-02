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
    
    var userType: UserType?
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    override func viewDidLoad() {
        let hideKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTapped))
        hideKeyboardTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideKeyboardTap)
    }
   

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
                UserDefaults.standard.set(user!.username, forKey: "username")
                UserDefaults.standard.synchronize()
                //what does this do?
                let appDelegate: AppDelegate =  UIApplication.shared.delegate as! AppDelegate
                appDelegate.login()
            }
        }
    }
    
    func hideKeyboardTapped(recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("In prepare for segue login VC")
        print("User type in prepare for segue login VC: \(userType!)")
        if let signUpVC: SignUpViewController = segue.destination as? SignUpViewController, let type = userType {
            switch type{
            case .Patient: signUpVC.userType = .Patient
            case .Doctor: signUpVC.userType = .Doctor
            }
        }
    }
    
    @IBAction func signUpPatient(_ sender: Any) {
         let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        userType = .Patient
        appDelegate.userType = userType
        performSegue(withIdentifier: "Log In To Sign Up", sender: nil)
    }
    
    @IBAction func signUpDoctor(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        userType = .Doctor
        appDelegate.userType = userType
        
        performSegue(withIdentifier: "Log In To Sign Up", sender: nil)
    }

}

