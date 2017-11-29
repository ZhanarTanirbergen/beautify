//
//  SaveViewController.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 26.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController, UIDocumentInteractionControllerDelegate {

    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    var documentController: UIDocumentInteractionController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.galleryButton.setBackgroundImage(UIImage(named: "gallery"), for: .normal)
        self.instagramButton.setBackgroundImage(UIImage(named: "insta"), for: .normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveToGallery(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(Photo.getOriginalImage(), self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @IBAction func shareToInstagram(_ sender: Any) {
        DispatchQueue.main.async {
            let instagramURL = URL(string: "instagram://app")
            
            if UIApplication.shared.canOpenURL(instagramURL!) {
                let imageData = UIImageJPEGRepresentation(Photo.getOriginalImage(), 100)
                let writePath = (NSTemporaryDirectory() as NSString).appendingPathComponent("instagram.igo")
                do {
                    try imageData?.write(to: URL(fileURLWithPath: writePath), options: .atomic)
                } catch {
                    print(error)
                }
                let fileURL = URL(fileURLWithPath: writePath)
                self.documentController = UIDocumentInteractionController(url: fileURL)
                self.documentController.delegate = self
                self.documentController.uti = "com.instagram.exlusivegram"
                if UIDevice.current.userInterfaceIdiom == .phone {
                    self.documentController.presentOpenInMenu(from: self.view.bounds, in: self.view, animated: true)
                }
            } else {
                print(" Instagram is not installed ")
            }
        }
    }
}
