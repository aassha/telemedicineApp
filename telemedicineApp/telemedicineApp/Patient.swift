//
//  Patient.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/27/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import Foundation
import Parse

//MARK: Aastha Shah
class Patient: PFUser {
    var name: String? {
        didSet {
            self["name"] = name
        }
    }
    var sex: String? {
        didSet {
            self["sex"] = sex
        }
    }
    var age: Int? {
        didSet{
            self["age"] = age
        }
    }

    
    var language: String?{
        didSet {
            self["language"] = language
        }
    }
    
    var profilePicture: PFFile? {
        didSet {
            self["profilePicture"] = profilePicture
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
    
    override static func parseClassName() -> String {
        return "_User"
    }
    
    override init() {
        super.init()
    }

    init(name: String, sex: String, age: Int, language: String, profilePicture: PFFile) {
        print(name)
        print(sex)
        print(age)
        print(language)
        self.name = name
        self.sex = sex
        self.age = age
        self.language = language
        self.profilePicture = profilePicture
        super.init()
    }
    
}
