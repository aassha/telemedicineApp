//
//  Types and Classes.swift
//  telemedicineApp
//
//  Created by An Hoang on 8/1/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import Foundation

enum UserType{
    case Patient
    case Doctor
}
enum Specialty: String {
    case obgyn = "obgyn"
    case dermatology = "dermatology"
    case mentalHealth = "mentalHealth"
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

