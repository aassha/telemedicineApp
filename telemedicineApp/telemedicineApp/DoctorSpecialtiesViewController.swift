//
//  DoctorSpecialtiesViewController.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/29/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

//import UIKit
//
//class DoctorSpecialtiesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
//    let doctors = Doctor()
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return doctors.doctorsArray.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = specialtiesCollection.dequeueReusableCell(withReuseIdentifier: "specialtyCell", for: indexPath) as! DoctorSpecialtiesCell
//        cell.specialtiesImage.image = UIImage(named: doctorSpecialties.specialties[indexPath.row] + ".PNG")
//        cell.specialtiesTitle.text = doctorSpecialties.specialties[indexPath.row]
//        return cell
//    }
//
//}
