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
    
    @IBOutlet weak var login: CustomButton?
    
    @IBOutlet weak var signUp: CustomButton?
    
    
    override func viewDidLoad() {
        let hideKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTapped))
        hideKeyboardTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideKeyboardTap)
    }
   

    @IBOutlet weak var appIconCustomView: customImageAnimation!

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
                //SOURCE: https://www.udemy.com/create-instagram-swift-xcode/learn/v4/content
                UserDefaults.standard.set(user!.username, forKey: "username")
                UserDefaults.standard.synchronize()
                //what does this do?
                let appDelegate: AppDelegate =  UIApplication.shared.delegate as! AppDelegate
                guard let type = UserType(rawValue: PFUser.current()?.value(forKey: "userType") as! String) else {
                    print("No userType received")
                    return
                }
                print(type)
                appDelegate.userType = type
                appDelegate.login()
                
            } else {
                let incorrectAccount = UIAlertController(title: "No Account Found!", message: "Please check the password and username", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                incorrectAccount.addAction(ok)
                self.present(incorrectAccount, animated: true, completion: nil)
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
            case .patient: signUpVC.userType = .patient
            case .doctor: signUpVC.userType = .doctor
            }
        }
    
    }
    
    @IBAction func signUpPatient(_ sender: Any) {
         let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        userType = .patient
        appDelegate.userType = userType
        performSegue(withIdentifier: "Log In To Sign Up", sender: nil)
    }
    
    @IBAction func signUpDoctor(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        userType = .doctor
        appDelegate.userType = userType
        
        performSegue(withIdentifier: "Log In To Sign Up", sender: nil)
    }

}

