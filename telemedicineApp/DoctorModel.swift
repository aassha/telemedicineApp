//
//  DoctorModel.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/29/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import Foundation

enum Specialty {
    case obgyn
    case dermatology
    case mentalHealth
    case optometry
    case orthopedics
    case pediatrics
}
class Doctor {
    struct Doctor{
        var name: String?
        var specialty: Specialty?
        var price: Int?
        var language: String?
    }
    var doctorsArray = [Doctor(name: "Shah", specialty: .pediatrics, price: 100, language: "English"), Doctor(name: "Vama", specialty: .orthopedics, price: 50, language: "English") ]
    func getNumberofDoctorsInEachSpecialty() -> Int {
        //SOURCE: https://stackoverflow.com/questions/40804458/how-to-filter-an-array-of-structs-with-value-of-other-array-in-swift
        return (doctorsArray.filter{($0.specialty != nil)}.count)
    }
    
}
