//
//  DoctorClass.swift
//  telemedicineApp
//
//  Created by An Hoang on 8/1/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import Foundation
import Parse


class DoctorRetrieveFromDB: NSObject {
//    var name: String? {
//        didSet {
//            self["name"] = name
//        }
//    }
//    var sex: String? {
//        didSet {
//            self["sex"] = sex
//        }
//    }
//    var age: Int? {
//        didSet{
//            self["age"] = age
//        }
//    }
//    
//    
//    var language: String?{
//        didSet {
//            self["language"] = language
//        }
//    }
//    
//    var profilePicture: PFFile? {
//        didSet {
//            self["profilePicture"] = profilePicture
//        }
//    }
    
    var name: String?
    
    var doctor: PFUser?
//    var doctorState: OnlineState?
    var doctorState: String?
    
    var licenseNum: Int?
    
    //var specialty: Specialty?
    var specialty:String?
    
    var numYearsPractice: Int?
    
    var price: Int?
    
    var location: String?
    
    var phoneNum: Int?
    
    var isOnline: Bool?
    override init() {
        super.init()
    }
    
  
    
    
}
