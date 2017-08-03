//
//  DoctorSpecialtiesViewController.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/29/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//
//MARK:Aastha Shah
import UIKit
import Parse
class customCell: UICollectionViewCell{
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
class DoctorViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var doctorCollection: UICollectionView!
    var array: [Any] = []
    var tappedCell: Int?
    var doctorsArray: [DoctorRetrieveFromDB]?
    var specialty:String?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        NSLog("Enter cV delegate")
        // if objects are not returned
        //then return 0
        //eslse self.doctorsArray.count
        if doctorsArray == nil {
            NSLog("Array is nil")
            return 0
        }
        
        NSLog("Array is not nil")
          return self.doctorsArray!.count
    }
    
//    override func viewDidLoad() {
//        var query = PFUser.query()
//        query?.whereKey("userState", contains: "doctor")
//        do {
//            let doctors: [PFObject] = try query!.findObjects()
//            print(doctors)
//        } catch {
//            print(error)
//        }
//    }
    
    override func viewDidLoad() {
        NSLog("Enter vDL")
        self.getDoctors()
        NSLog("Exiting vDL")
        
    }
    
    func getDoctors() {
        var x: Int?
        // x nil
        x = 4
        var c: UIViewController?
        // c nil
        c = UIViewController()
        
        NSLog("Enter getDoctor")
        let doctorQuery = PFUser.query()
        doctorQuery?.whereKey("userType", equalTo: "doctor")
        doctorQuery?.whereKey("specialty",equalTo: self.specialty!)
        doctorQuery?.includeKey("specialty")
        doctorQuery?.includeKey("doctorState")
        doctorQuery?.findObjectsInBackground(block: { (objects, error:Error?) in
            NSLog("Entering result closure:\(Thread.isMainThread)")
            let doctorInfo = objects as? [PFUser]
            self.doctorsArray = Array() // []
            for doc in doctorInfo!{
                let doctorAn = DoctorRetrieveFromDB()
                doctorAn.doctor = doc
                doctorAn.specialty = doc["specialty"] as? String
                self.doctorsArray?.append(doctorAn)
                print(doctorAn)
            }
            NSLog("About to reload data")
            self.doctorCollection.reloadData()
            NSLog("Exiting result closure")
        })
        NSLog("Exiting getDoctors()")
      
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
   
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let array = doctorsArray else {
            return UICollectionViewCell()
        }
        if array[indexPath.row].doctorState == "online" {
        let cell = doctorCollection.dequeueReusableCell(withReuseIdentifier: "cellOnline", for: indexPath) as! customCell
        //cell.imageProfile.image = UIImage(named: doctorSpecialties.specialties[indexPath.row] + ".PNG")
        cell.nameLabel.text = array[indexPath.row].name
        cell.priceLabel.text = String(describing: array[indexPath.row].price)
        return cell
        }
        
        if array[indexPath.row].doctorState == "offline" {
            let cell = doctorCollection.dequeueReusableCell(withReuseIdentifier: "cellOffline", for: indexPath) as! customCell
            //cell.imageProfile.image = UIImage(named: doctorSpecialties.specialties[indexPath.row] + ".PNG")
            cell.nameLabel.text = array[indexPath.row].name
            cell.priceLabel.text = String(describing: array[indexPath.row].price)
            return cell
        }
        let cell = doctorCollection.dequeueReusableCell(withReuseIdentifier: "cellOnline", for: indexPath) as! customCell
        //cell.imageProfile.image = UIImage(named: doctorSpecialties.specialties[indexPath.row] + ".PNG")
        cell.nameLabel.text = array[indexPath.row].name
        cell.priceLabel.text = String(describing: array[indexPath.row].price)
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
//            doctorProfile.language = array[selectedCell].language!
//            doctorProfile.specialty = array[selectedCell].specialty
//            doctorProfile.location = array[selectedCell].location!
//            //doctorProfile.experience = array[selectedCell].numYearsPractice!
//            doctorProfile.state = array[selectedCell].doctorState

        }
    }
    
}
