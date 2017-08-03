//
//  DoctorProfileVC.swift
//  telemedicineApp
//
//  Created by An Hoang on 8/2/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit

class DoctorProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBOutlet weak var doctorNameLabel: UILabel!
    
    @IBOutlet weak var licenseNumberLabel: UILabel!
    
    @IBOutlet weak var specialtyLabel: UILabel!
    
    @IBOutlet weak var yearsOfExperienceLabel: UILabel!
    
    @IBOutlet weak var desiredRate: UILabel!
    
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var doctorStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        guard let currentUser = DoctorAn.current() else{
            print("no user in profile VC")
            return
        }
        
//        let profileImageQuery = (currentUser.object(forKey: "profileImage") as! PFFile)
//        
//        
//        profileImageQuery .getDataInBackground { (data, error) -> Void in
//            self.profileImage.image = UIImage(data: data!)
//        }
        
        doctorNameLabel.text = (currentUser.object(forKey: "name") as! String)
        
        locationLabel.text = (currentUser.object(forKey: "location") as! String)
        
        specialtyLabel.text = (currentUser.object(forKey: "specialty") as! String)
        
      doctorStateLabel.text = (currentUser.object(forKey: "doctorState") as! String)
        
            
        licenseNumberLabel.text = String(describing:(currentUser.object(forKey: "licenseNum") as! Int))
        
        yearsOfExperienceLabel.text = String(describing:(currentUser.object(forKey: "numYearsPractice") as! Int))
        
        desiredRate.text = String(describing:(currentUser.object(forKey: "price") as! Int))
        phoneNumLabel.text = String(describing:(currentUser.object(forKey: "phoneNum") as! Int))
        
        
    }
    
    
    
    @IBAction func goOfforOnline(_ sender: Any) {
        guard let currentUser = DoctorAn.current() else{
            print("No User")
            return
        }
        
        if stateSwitch.isOn{
            stateSwitch.setOn(false, animated: true)
            currentUser["doctorState"] = "offline"
        }else{
            stateSwitch.setOn(true, animated: true)
            currentUser["doctorState"] = "online"
        }
        
        currentUser.saveInBackground { (success, error) -> Void in
            if error == nil {
                print("Saved in server")
            } else {
                print(error!)
            }
        }
        print("about to update UI")
        updateUI()
        
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
