//
//  Document.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/26/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//
//MARK: Aastha Shah
import Foundation

protocol DocumentModelListenerProtocol{
    func documentsChanged() -> Void
}
class Document {
    var delegate: DocumentModelListenerProtocol?
    
    struct DocumentItems {
        var medicineName: String
        var notes: String
    }
    
    var documents = [ DocumentItems(medicineName: "Nyquil",notes: "Take once before going to bed" ),
                    DocumentItems(medicineName: "Vitamin A",notes: "Take once before going to bed" )
    ]
    
    func addDocument(medicineName: String, notes: String) {
        documents.append(DocumentItems(medicineName: medicineName, notes: notes))
        delegate?.documentsChanged()
    }
    
    func textChanged() {
        delegate?.documentsChanged()
    }
}
