//
//  Types and Classes.swift
//  telemedicineApp
//
//  Created by An Hoang on 8/1/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import Foundation

enum UserType: String {
    case patient = "patient"
    case doctor = "doctor"
}
enum Specialty: String {
    case obgyn = "obgyn"
    case cardiology = "cardiology"
    case dentistry = "dentistry"
    case optometry = "optometry"
    case orthopedics = "orthopedics"
    case pediatrics = "pediatrics"
}
enum OnlineState : String{
    case online = "online"
    case offline = "offline"
}
struct Doctor{
    var name: String?
    var specialty: Specialty?
    var price: Int?
    var language: String?
    var state: OnlineState
}

protocol ItemEdited {
    func itemEdited(medicineName: String, notes: String)
}
protocol DocumentModelListenerProtocol{
    func documentsChanged() -> Void
}

