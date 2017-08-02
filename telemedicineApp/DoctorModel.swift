//
//  DoctorModel.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/29/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import Foundation
class DoctorModel {
    var doctorsArray = [
        Doctor(name: "Shah", specialty: .pediatrics, price: 100, language: "English", state: .offline),
        Doctor(name: "Vama", specialty: .orthopedics, price: 50, language: "English", state: .online),
        Doctor(name: "An", specialty: .mentalHealth, price: 75, language: "English", state: .online)]
    
    func getNumberofDoctorsInEachSpecialty(specialty:Specialty) -> [Doctor] {
        //SOURCE: https://stackoverflow.com/questions/40804458/how-to-filter-an-array-of-structs-with-value-of-other-array-in-swift
        return doctorsArray.filter({$0.specialty == specialty})
    }
    
    func getArrayOfDoctorsOnline (state: OnlineState)-> [Doctor] {
        return doctorsArray.filter({$0.state == state})
    }
}
