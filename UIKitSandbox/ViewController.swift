//
//  ViewController.swift
//  UIKitSandbox
//
//  Created by Stella Su on 6/18/15.
//  Copyright (c) 2015 Million Stars, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    @IBOutlet weak var textTop: UITextField!
    @IBOutlet weak var textBottom: UITextField!
    @IBOutlet weak var buttomToolbar: UIToolbar!
    @IBOutlet weak var imagePickView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        textTop.textAlignment = .Center
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // Disable the camera button if the device doesn't have a camera
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    }
    
  
    // Function that allows the user to pick an image from either the photo library or from their camera
    @IBAction func pickAnImage(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if sender.title == "Album"{
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
        } else{
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        //self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    // Passes the image selected by the user to the imagePickView
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            //imagePickView.contentMode = UIViewContentMode.ScaleAspectFit
            imagePickView.image = image
            
        } else {
            println("No image was picked")
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    



}

