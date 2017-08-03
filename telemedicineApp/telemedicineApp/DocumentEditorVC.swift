//
//  DocumentEditorVC.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/26/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit
//MARK: Aastha Shah
protocol ItemEdited {
    func itemEdited(medicineName: String, notes: String)
}

class DocumentEditorVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    
    @IBOutlet weak var documentImage: UIImageView!
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
        
        let documentImageTap = UITapGestureRecognizer(target: self, action: #selector(placeImage))
        documentImageTap.numberOfTapsRequired = 1
        self.documentImage.isUserInteractionEnabled = true
        self.documentImage.addGestureRecognizer(documentImageTap)
        documentImage.clipsToBounds = true
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
    
    func placeImage(recognizer: UITapGestureRecognizer){
        let selectImage = UIImagePickerController()
        selectImage.delegate = self
        selectImage.sourceType = .photoLibrary
        selectImage.allowsEditing = true
        present(selectImage, animated: true, completion: nil)
    }
    
    //set selected image as image profile picture
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        documentImage.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    

}
