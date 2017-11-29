//
//  FirstPageController.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 20.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import UIKit
import Spring

class FirstPageController: UIViewController {
    

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration:0.5, delay:0, options: [.repeat, .curveLinear], animations: {
                UIView.setAnimationRepeatCount(2)
                self.imageView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI),0.0,1.0,0.0);
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
