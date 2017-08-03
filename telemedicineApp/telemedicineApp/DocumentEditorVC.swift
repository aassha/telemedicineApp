//
//  DocumentEditorVC.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/26/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit



class DocumentEditorVC: UIViewController {
    
    
    var medicineNameText: String = ""
//        {
//        didSet {
//            print(medicineNameText)
//        }
//    }
    var notesText: String = "" {
        didSet {
            if isViewLoaded {
                notesTextBox.text = notesText
            }
        }
    }
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var medicineNameTextField: UITextField!
    @IBOutlet weak var notesTextBox: UITextView!
    var reciever: ItemEdited?
    var mainView: DocumentEditorVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        //why must this be redefined here
        print("medicineName \(medicineNameText) ")
        medicineNameTextField.text = medicineNameText
        print("textfield \(medicineNameTextField.text) ")
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
