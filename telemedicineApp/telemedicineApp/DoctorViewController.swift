//
//  DoctorSpecialtiesViewController.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/29/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit
class customCell: UICollectionViewCell{
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
class DoctorViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var doctorCollection: UICollectionView!
    var array: [Any] = []
    
    var doctorsArray: [Doctor]?
//        = [] {
//        didSet {
//            doctorsArray = array
//        }
//    }
    //not enetring this function at all
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let array = doctorsArray else{
            return 0
        }
        print("Number of array once in Doctors: \(array.count)")
        return array.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = doctorCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! customCell
        //cell.imageProfile.image = UIImage(named: doctorSpecialties.specialties[indexPath.row] + ".PNG")
        guard let array = doctorsArray else {
            return UICollectionViewCell()
        }
        cell.nameLabel.text = array[indexPath.row].name
        //cell.priceLabel.text = doctorsArray?[indexPath.row]
            //doctorSpecialties.specialties[indexPath.row]
        return cell
    }
    
    
}
