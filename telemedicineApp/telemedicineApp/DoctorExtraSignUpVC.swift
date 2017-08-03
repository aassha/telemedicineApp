//
//  DoctorExtraSignUpVC.swift
//  telemedicineApp
//
//  Created by An Hoang on 8/1/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit

class DoctorExtraSignUpVC: UIViewController {
    var doctor: DoctorAn?
    
    @IBOutlet weak var locationField: UITextField!
    
    @IBOutlet weak var phoneNumberField: UITextField!
    
    @IBOutlet weak var licenseNumberField: UITextField!
    
    @IBOutlet weak var specialtyField: UITextField!
    
    @IBOutlet weak var yearsOfExperienceField: UITextField!
    
    @IBOutlet weak var priceField: UITextField!
    
    
    @IBAction func cancelMoreInfo(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishSignUpDoctor(_ sender: Any) {
        guard let newDoctor = doctor else{
            print("No Doctor to sign up")
            return
        }
        guard let licenseNum = licenseNumberField.text, let specialty = specialtyField.text, let years = yearsOfExperienceField.text, let price = priceField.text,let phoneNum = phoneNumberField.text, let location = locationField.text else{
            //add location
            print("Missing extra info fields")
            return
        }
        
        if licenseNum.isEmpty || specialty.isEmpty || years.isEmpty || price.isEmpty || phoneNum.isEmpty{
            print("Empty fields")
        }else{
            //saving data to server
            newDoctor.numYearsPractice = Int(years)
            newDoctor.specialty = Specialty(rawValue: specialty)
            newDoctor.licenseNum = Int(licenseNum)
            newDoctor.price = Int(price)
            newDoctor.phoneNum = Int(phoneNum)
            newDoctor.location = location
            
            let state = newDoctor.doctorState?.rawValue
            newDoctor["state"] = state
            
            
            //            doctor?.numYearsPractice = Int(years)
            //            doctor?.specialty = Specialty(rawValue: specialty)
            //            doctor?.licenseNum = Int(licenseNum)
            //            doctor?.price = Int(price)
            //            let state = newDoctor.doctorState?.rawValue
            //            doctor?["state"] = doctor?.doctorState?.rawValue
            
            newDoctor.signUpInBackground { (success, error) in
                if success {
                    print("registered")
                    //remembers user's info
                    UserDefaults.standard.set(self.doctor?.username, forKey: "username")
                    UserDefaults.standard.synchronize()
                    //why must this be called here
                    
                    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.login()
                } else {
                    print(error?.localizedDescription)
                }
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
