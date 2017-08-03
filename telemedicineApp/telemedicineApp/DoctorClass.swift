//
//  DoctorClass.swift
//  telemedicineApp
//
//  Created by An Hoang on 8/1/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import Foundation
import Parse


class DoctorAn: Patient {
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
    
   
    var doctorState: OnlineState?{
        didSet{
            print(doctorState?.rawValue ?? "No state")
            self["state"] = doctorState?.rawValue
        }
    }
    
    var licenseNum: Int?{
        didSet{
            self["licenseNum"] = licenseNum
        }
    }
    
    var specialty: Specialty?{
        didSet{
            self["specialty"] = specialty?.rawValue
        }
    }
    
    var numYearsPractice: Int?{
        didSet{
            self["numYearsPractice"] = numYearsPractice
        }
    }
    
    var price: Int?{
        didSet{
            self["price"] = price
        }
    }
    
    var location: String?{
        didSet{
            self["location"] = location
        }
    }
    
    var phoneNum: Int?{
        didSet{
            self["phoneNum"] = phoneNum
        }
    }
    
    
    var isOnline: Bool?{
        didSet{
            self["isOnline"] = isOnline
        }
    }
    override init() {
        super.init()
    }
    
    override init(name: String, sex: String, age: Int, language: String) {
        super.init()
        self.name = name
        self.sex = sex
        self.age = age
        self.language = language
        self.userType = .doctor
        self.doctorState = .offline
        
    }
    
    
}
