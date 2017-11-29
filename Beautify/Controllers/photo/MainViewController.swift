//
//  MainViewController.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 24.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
//    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveAction));
        navigationItem.rightBarButtonItem = doneItem
        imgView.image = Photo.getOriginalImage()
    }

    @IBAction func goToToolsAction(_ sender: Any) {
        let nextViewController = Constants.storyBoard.instantiateViewController(withIdentifier: "ToolsViewController") as! ToolsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func goToFiltersAction(_ sender: Any) {
        let nextViewController = Constants.storyBoard.instantiateViewController(withIdentifier: "FiltersViewController") as! FiltersViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func saveAction() {
        let nextViewController = Constants.storyBoard.instantiateViewController(withIdentifier: "SaveViewController") as! SaveViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
