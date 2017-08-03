//
//  DoctorModel.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/29/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//
//MARK: Aastha Shah
import Foundation
class DoctorModel {
    
    func getNumberofDoctorsInEachSpecialty(specialty:Specialty) -> [Doctor] {
        return doctorsArray.filter({$0.specialty == specialty})
    }
    
    func getArrayOfDoctorsOnline (state: OnlineState)-> [Doctor] {
        return doctorsArray.filter({$0.state == state})
    }
}
