//
//  DoctorSpecialtiesViewController.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/29/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//
//MARK:Aastha Shah
import UIKit
class customCell: UICollectionViewCell{
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
class DoctorViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var doctorCollection: UICollectionView!
    var array: [Any] = []
    var tappedCell: Int?
    var doctorsArray: [Doctor]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let array = doctorsArray else{
            return 0
        }
        return array.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let array = doctorsArray else {
            return UICollectionViewCell()
        }
        if array[indexPath.row].state == .online {
        let cell = doctorCollection.dequeueReusableCell(withReuseIdentifier: "cellOnline", for: indexPath) as! customCell
        //cell.imageProfile.image = UIImage(named: doctorSpecialties.specialties[indexPath.row] + ".PNG")
        cell.nameLabel.text = array[indexPath.row].name
        //cell.priceLabel.text = doctorsArray?[indexPath.row]
            //doctorSpecialties.specialties[indexPath.row]
        return cell
        }
        
        if array[indexPath.row].state == .offline {
            let cell = doctorCollection.dequeueReusableCell(withReuseIdentifier: "cellOffline", for: indexPath) as! customCell
            //cell.imageProfile.image = UIImage(named: doctorSpecialties.specialties[indexPath.row] + ".PNG")
            cell.nameLabel.text = array[indexPath.row].name
            //cell.priceLabel.text = doctorsArray?[indexPath.row]
            //doctorSpecialties.specialties[indexPath.row]
            return cell
        }
        let cell = doctorCollection.dequeueReusableCell(withReuseIdentifier: "cellOnline", for: indexPath) as! customCell
        //cell.imageProfile.image = UIImage(named: doctorSpecialties.specialties[indexPath.row] + ".PNG")
        cell.nameLabel.text = array[indexPath.row].name
        //cell.priceLabel.text = doctorsArray?[indexPath.row]
        //doctorSpecialties.specialties[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tappedCell = indexPath.row
        self.performSegue(withIdentifier: "doctorProfile", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCell = tappedCell else {
            return
        }
        guard let array = doctorsArray else {
            return
        }
        if let doctorProfile = segue.destination as? DoctorProfileViewController {
            doctorProfile.doctorNameVar = array[selectedCell].name!
//           doctorProfile.price = array[selectedCell].price!
            doctorProfile.language = array[selectedCell].language!
            doctorProfile.specialty = array[selectedCell].specialty!.rawValue
            doctorProfile.location = array[selectedCell].location!
            //doctorProfile.experience = array[selectedCell].numYearsPractice!
            doctorProfile.state = array[selectedCell].state.rawValue

        }
    }
    
}
