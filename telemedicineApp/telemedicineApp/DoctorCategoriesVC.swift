//
//  DoctorSpecialtiesVC.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/29/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit
class DoctorSpecialtiesCell: UICollectionViewCell {
    
    @IBOutlet weak var specialtiesImage: UIImageView!
    
    @IBOutlet weak var specialtiesTitle: UILabel!
}

class DoctorSpecialtiesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let doctorSpecialties = DoctorSpecialties()
    
    @IBOutlet weak var specialtiesCollection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doctorSpecialties.specialties.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = specialtiesCollection.dequeueReusableCell(withReuseIdentifier: "specialtyCell", for: indexPath) as! DoctorSpecialtiesCell
        cell.specialtiesImage.image = UIImage(named: doctorSpecialties.specialties[indexPath.row] + ".PNG")
        cell.specialtiesTitle.text = doctorSpecialties.specialties[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        let doctor = Doctor()
        print(doctor.getNumberofDoctorsInEachSpecialty())
    }

}
