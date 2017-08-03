//
//  PatientProfileVC.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 8/2/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit
import Parse
class PatientProfileVC: UIViewController {
    
    @IBOutlet weak var sexLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBAction func logoutAction(_ sender: Any) {
        PFUser.logOut()
        let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //delegate.currentUser = PFUser.current()
        PFUser.logOut()
    }
    
    
    override func viewDidLoad() {
            updateUI()
   }
    func updateUI() {
        nameLabel.text = (Patient.current()?.object(forKey: "name") as? String)!
        sexLabel.text = (Patient.current()?.object(forKey: "sex") as? String)!
        languageLabel.text = (Patient.current()?.object(forKey: "language") as? String)!
//        guard let age = else{
//            print("nil age")
//            return
//        }

        ageLabel.text = String(describing:  (Patient.current()?.object(forKey: "age")as! Int))
    }
    

}
