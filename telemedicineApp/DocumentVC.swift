//
//  DocumentVC.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/26/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//

import UIKit

class DocumetCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var medicineName: UILabel!
    @IBOutlet weak var notes: UILabel!
}

class DocumentVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ItemEdited {
    
    var documentsModel = Document()
    var tappedCell: Int?
    @IBOutlet weak var documentCollection: UICollectionView!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return documentsModel.documents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = documentCollection.dequeueReusableCell(withReuseIdentifier: "docuemtCell", for: indexPath) as! DocumetCell
        cell.image.image = UIImage(named: documentsModel.documents[indexPath.row].medicineName + ".JPG")
        cell.medicineName.text = documentsModel.documents[indexPath.row].medicineName
        cell.notes.text = documentsModel.documents[indexPath.row].notes
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editorSegue", sender: nil)
    }
    
    func documentsChanged() {
        documentCollection.reloadData()
    }
    
    func itemEdited(medicineName: String, notes: String) {
        //need to get index properly
        documentsModel.documents[0].medicineName = medicineName
        documentsModel.documents[0].notes = notes
        documentCollection.reloadData()
        documentsModel.textChanged()
    }
    
    @IBAction func addDocument(_ sender: Any) {
        documentsModel.addDocument(medicineName: "Medicine Name", notes: "Additional Notes")
        let indexPath = IndexPath(row:(documentsModel.documents.count)-1, section:0)
        documentCollection.insertItems(at: [indexPath])
        documentCollection.selectItem(at: indexPath, animated: true, scrollPosition: [])
        self.performSegue(withIdentifier: "editorSegue", sender: nil)
        print(documentsModel.documents)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editorVC: DocumentEditorVC = segue.destination as? DocumentEditorVC {
            let cellArray = documentCollection.indexPathsForSelectedItems
            let selectedCell = cellArray?[0]
            //how to get index of selected cell
            editorVC.reciever = self
            editorVC.medicineNameText = documentsModel.documents[0].medicineName
            editorVC.notesText = documentsModel.documents[0].notes
        }
        
    }
}

    


