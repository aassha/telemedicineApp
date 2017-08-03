//
//  DoctorSpecialtiesVC.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/29/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//
//MARK: Aastha Shah
import UIKit
class DoctorSpecialtiesCell: UICollectionViewCell {
    
    @IBOutlet weak var specialtiesImage: UIImageView!
    
    @IBOutlet weak var specialtiesTitle: UILabel!
}

class DoctorSpecialtiesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let doctorSpecialties = DoctorSpecialties()
    let doctorModel = DoctorModel()
    var tappedCell: Int?
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tappedCell = indexPath.row
        print("path: \(indexPath.row)")
        print("Cell: \(tappedCell)")
        self.performSegue(withIdentifier: "segueToDoctors", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCell = tappedCell else{
            return
        }
        if let doctorsVC: DoctorViewController = segue.destination as? DoctorViewController{
            print(selectedCell)
            let filteredArray = doctorModel.getNumberofDoctorsInEachSpecialty(specialty: Specialty(rawValue: doctorSpecialties.specialties[selectedCell])!)
            doctorsVC.doctorsArray = filteredArray
        }
    }
    
    

}
