//
//  DoctorProfileVC.swift
//  telemedicineApp
//
//  Created by An Hoang on 8/2/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit

class DoctorProfileVC: UIViewController {

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
