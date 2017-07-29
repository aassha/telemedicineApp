//
//  DocumentEditorVC.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/26/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit

protocol ItemEdited {
    func itemEdited(medicineName: String, notes: String)
}

class DocumentEditorVC: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var medicineNameTextField: UITextField!
    @IBOutlet weak var notesTextBox: UITextView!
    
    var medicineNameText: String = "" {
        didSet {
            if isViewLoaded {
                medicineNameTextField.text = medicineNameText
            }//used for switching out words from different rows
        }
    }
    
    var notesText: String = "" {
        didSet {
            if isViewLoaded {
                notesTextBox.text = notesText
            }
        }
    }
    
    var reciever: ItemEdited?
    var mainView: DocumentEditorVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        //why must this be redefined here
        medicineNameTextField.text = medicineNameText
        notesTextBox.text = notesText
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let name =  medicineNameTextField.text,
            let description = notesTextBox.text else {
                // complain horribly
                print("No text!!")
                return
        }
        reciever?.itemEdited(medicineName: name, notes: description)
    }
    

}
