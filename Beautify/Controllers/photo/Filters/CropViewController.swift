//
//  CropViewController.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 27.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import UIKit

class CropViewController: UIViewController {

    @IBOutlet weak var cropView: MSCropView!
    var delegate: Delegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cropView.setup(image: Photo.getOriginalImage())
        let doneItem = UIBarButtonItem(title: "Crop", style: .plain, target: self, action: #selector(cropAction));
        navigationItem.rightBarButtonItem = doneItem
    }
    
    @IBAction func cropAction() {
        self.cropView.cropImage()
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
