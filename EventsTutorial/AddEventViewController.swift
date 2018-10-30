//
//  AddEventViewController.swift
//  EventsApp
//
//  Created by Alejandro Carbajal on 9/20/18.
//  Copyright © 2018 Alejandro Carbajal. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class AddEventViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    


    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    

    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activity.isHidden = true
        
        datePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: UIControl.Event.valueChanged)
        
        dateFormat()
        
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        imageButton.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBAction func createEvent(_ sender: Any) {
            if activity.isAnimating == true
            {
                activity.isHidden = true
                activity.stopAnimating()
        }
        else
            {
                activity.isHidden = false
                activity.startAnimating()
        }
        
        let name = PFObject(className: "Events")
        name["location"] = locationLabel.text
        name["date"] = dateLabel.text
        name["name"] = nameLabel.text
        

        let imageData = self.imageView.image!.pngData()
        let parseImageFile = PFFile(name: "uploaded_image.png", data: imageData!)
        
        name["image"] = parseImageFile

        name.saveInBackground {
            (success: Bool, error: Error?) -> Void in

            if (success) {
                print("success")
                self.performSegue(withIdentifier: "SuccessSegue", sender: self)

            }else{

                print("error")
                self.performSegue(withIdentifier: "ErrorSegue", sender: self)
            }

            

        }

        
        name.saveInBackground {
            (success: Bool, error: Error?) -> Void in
            
            if (success) {


            }else {
                
            }

        }


    }



    func dateFormat() {

        let dateFormatter = DateFormatter()
        let short = DateFormatter.Style.short
        dateFormatter.dateStyle = short
        dateFormatter.timeStyle = short
        dateFormatter.dateFormat = "MM/dd/YY hh:mm a"
        
        let strDate = dateFormatter.string(from: datePicker.date)

        dateLabel.text = strDate


    }

    @objc func datePickerChanged(datePicker:UIDatePicker) {
        
        dateFormat()
    }
    

    @IBAction func loadImage(_ sender: Any) {
        imagePicker.delegate = self
//        imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
//        self.present(imagePicker, animated: true, completion: nil)


        imageButton.isHidden = true
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary

        present(imagePicker, animated: true, completion: nil)


    }

    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)


        if let pickedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as?
        
            UIImage {

            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }

        dismiss(animated: true, completion: nil)
        
        
    }


    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }



}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
    

}


