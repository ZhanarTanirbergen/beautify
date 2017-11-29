//
//  PhotoPickViewController.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 05.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import UIKit
//TODO: set imageView.alpha
class PhotoPickViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextAction));
        navigationItem.rightBarButtonItem = doneItem
        imagePicker.delegate = self
        imgView.image = UIImage(named: "butterfly")
    }
    
    @IBAction func nextAction() {
        Photo.setOriginalImage(originalImage: imgView.image!)
        let nextViewController = Constants.storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

    @IBAction func actionClickOnCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            imagePicker.allowsEditing = true;
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present(imagePicker, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Alert", message: "You don't have a camera for this device", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionClickOnGallery(_ sender: Any) {
        imagePicker.allowsEditing = true;
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imgView.image = image
        } else{
            print("Something went wrong")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

