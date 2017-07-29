//
//  SignUpViewController.swift
//  telemedicineApp
//
//  Created by Aastha Shah on 7/27/17.
//  Copyright © 2017 Aastha Shah. All rights reserved.
//
//what else can be put in model
import UIKit
import Parse

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let patient = Patient()
    
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var retypePasswordtxt: UITextField!
    
    @IBOutlet weak var agetxt: UITextField!
    
    @IBOutlet weak var sextxt: UITextField!
    
    @IBOutlet weak var langaugetxt: UITextField!
    
    @IBOutlet weak var signUpButton: CustomButton!
    @IBAction func signUpAction(_ sender: Any) {
        self.view.endEditing(true)
        if ((nametxt.text?.isEmpty)! || (password.text?.isEmpty)! || (retypePasswordtxt.text?.isEmpty)! || (agetxt.text?.isEmpty)! || (sextxt.text?.isEmpty)! || (langaugetxt.text?.isEmpty)!) {
            let missingFieldAlert = UIAlertController(title: "Missing Information", message: "Please fill all missing information", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            missingFieldAlert.addAction(ok)
            self.present(missingFieldAlert, animated: true, completion: nil)
        }
        //can put this in model
        if retypePasswordtxt.text != password.text {
            let passwordsDoNotMatch = UIAlertController(title: "Passwords do not match", message: "Please make sures the passwords match", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            passwordsDoNotMatch.addAction(ok)
            self.present(passwordsDoNotMatch, animated: true, completion: nil)
        }
        
        let user = PFUser()
        user.username = nametxt.text
        user.password = password.text
        user["Age"] = agetxt.text
        user["Sex"] = sextxt.text
        user["Language"] = langaugetxt.text
        user["telphoneNumber"] = ""
        //photo conversion to jpg
        let profileData = UIImageJPEGRepresentation(profileImage.image!, 0.5)
        let profileFile = PFFile(name: "profile.jpg", data: profileData!)
        user["profilePicture"] = profileFile
        //saving data to server
        user.signUpInBackground { (success, error) in
            if success {
                print("registered")
                //remembers user's info
                UserDefaults.standard.set(user.username, forKey: "name")
                UserDefaults.standard.synchronize()
                //why must this be called here 
                
                let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.login()
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    @IBOutlet weak var cancelButton: CustomButton!
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var keyboard: CGRect?
    var scrollHeight: CGFloat = 0
    
    override func viewDidLoad() {
        //sets the scrollView's frame to that of the main view controller, that is the screen size
        scrollView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        //sets the scrolling to the height of the main view
        scrollView.contentSize.height = self.view.frame.height
        scrollHeight = scrollView.frame.size.height
        
        //notifications for when the keyboard is pulled up
        //the selector will be run depending on if the keyboard is shown of noth
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let hideKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardTapped))
        //can this be done in storyboard instead of code
        hideKeyboardTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideKeyboardTap)
        
        let profileImageTap = UITapGestureRecognizer(target: self, action: #selector(placeImage))
        profileImageTap.numberOfTapsRequired = 1
        self.profileImage.isUserInteractionEnabled = true
        self.profileImage.addGestureRecognizer(profileImageTap)
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
    }
    
    //allows for scrolling when keyboard is shown, it prevents the bottom buttons and textFields from being hidden
    func showKeyboard(notification: NSNotification) {
        //keyboard sizes are defined here
        keyboard = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue
        UIView.animate(withDuration: 0.4) {
            //the new value of the scroll is the total height minus the keyboard height
            //only this much of the view can be scrolled
            self.scrollView.frame.size.height = self.scrollHeight - (self.keyboard?.height)!
        }
    }
    //allows the screen to return to normal where there is no scrolling permitted
    func hideKeyboard(notification: NSNotification) {
        UIView.animate(withDuration: 0.4) {
            self.scrollView.frame.size.height = self.view.frame.height
        }
    }
    //tapping on view will hide the keyboard as editing is no longer allowed
    //touching the textFields automatically engages the keyboard because it is in built
    func hideKeyboardTapped(recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
        profileImage.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
}
