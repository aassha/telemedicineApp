//
//  Patient.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/27/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import Foundation
import Parse


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
    
    var userType :UserType?{
        didSet{
            self["userType"] = userType?.rawValue
        }
    }
    
    override init() {
        super.init()
    }

    init(name: String, sex: String, age: Int, language: String) {
        print(name)
        print(sex)
        print(age)
        print(language)
        self.name = name
        self.sex = sex
        self.age = age
        self.language = language
        self.userType = .patient
        super.init()
    }
    
    
}
