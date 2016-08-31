//
//  PetViewController.swift
//  Petopia
//
//  Created by Cahyanto Setya Budi on 8/15/16.
//  Copyright © 2016 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class PetViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var pet: Pet?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBAction func pickImage(sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        if let pet = pet {
            nameTextField.text = pet.name
            typeTextField.text = pet.type
            descriptionTextField.text = pet.description
            photoImageView.image = pet.photo
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        let isPresentedAndPetMode = presentingViewController is UINavigationController
        if isPresentedAndPetMode {
            dismissViewControllerAnimated(true, completion: nil)
        }else{
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveBarButton === sender {
            let name = nameTextField.text
            let type = typeTextField.text
            let desc = descriptionTextField.text
            let photo = photoImageView.image
            
            pet = Pet(name: name!, type: type!, description: desc!, photo: photo!)
            
        }
    }
}