//
//  ToolsViewController.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 26.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import UIKit

class ToolsViewController: UIViewController, Delegate {
   
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var originalImage: UIImageView!
    @IBOutlet weak var imageToFilter: UIImageView!
    @IBOutlet weak var toolsScrollView: UIScrollView!
    var contrastFilter: CIFilter!
    var brightnessFilter: CIFilter!
    var okButton: UIButton!

    func createButton() {
        self.okButton = Button.init(xCoord: 320, yCoord: 70).getButton()
        self.okButton.tag = 2
        self.okButton.setTitleColor(UIColor.blue, for: .normal)
        self.okButton.setTitle("OK", for: .normal)
        self.okButton.addTarget(self, action: #selector(self.okButtonTapped(sender:)), for: .touchUpInside)
    }
    @objc func filterButtonTapped(sender: UIButton) {
        let button = sender as UIButton
        for subview in view.subviews {
            if (subview.tag == 1 || subview.tag == 2) {
                subview.removeFromSuperview()
            }
        }
        switch button.tag {
        case 0:
            let nextViewController = Constants.storyBoard.instantiateViewController(withIdentifier: "CropViewController") as! CropViewController
            nextViewController.delegate = self
            self.navigationController?.pushViewController(nextViewController, animated: true)
        case 1:
            self.originalImage.isHidden = true
            self.imageToFilter.isHidden = false
            Photo.setCurrentFilter(currentFilter: CIFilter(name:"CIColorControls")!)
            self.imageToFilter.image = Photo.applyFilter(filter: CIFilter(name:"CIColorControls")!)
            let mySlider = Slider.init().getSlider()
            mySlider.addTarget(self, action: #selector(self.sliderContrastValueChanged(sender:)), for: .valueChanged)
            self.view.addSubview(mySlider)
            self.view.addSubview(self.okButton)
        case 2:
            self.originalImage.isHidden = true
            self.imageToFilter.isHidden = false
            Photo.setCurrentFilter(currentFilter: CIFilter(name:"CIColorControls")!)
            self.imageToFilter.image = Photo.applyFilter(filter: CIFilter(name:"CIColorControls")!)
            let mySlider = Slider.init().getSlider()
            mySlider.addTarget(self, action: #selector(self.sliderBrightnessValueChanged(sender:)), for: .valueChanged)
            self.view.addSubview(mySlider)
            self.view.addSubview(self.okButton)
        default:
            print("here")
        }
        
    }
    @objc func okButtonTapped(sender: UIButton) {
        Photo.setOriginalImage(originalImage: self.imageToFilter.image!)
        for subview in view.subviews {
            if (subview.tag == 1 || subview.tag == 2) {
                subview.removeFromSuperview()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton()
        
        let doneItem = UIBarButtonItem(title: "Apply", style: .plain, target: self, action: #selector(goToMainAction));
        navigationItem.rightBarButtonItem = doneItem
        self.originalImage.image = Photo.getOriginalImage()
        
        var xCoord: CGFloat = 5
        var yCoord: CGFloat = 5
        var itemCount = 0
        
        for i in 0..<3 {
            itemCount = i
            let toolButton = ToolsButton.init(xCoord: xCoord, yCoord: yCoord).getButton()
            toolButton.tag = itemCount
            toolButton.addTarget(self, action: #selector(self.filterButtonTapped(sender:)), for: .touchUpInside)
            toolButton.setTitleColor(UIColor.blue, for: .normal)
            toolButton.setTitle(ToolsButton.getButtonsList()[i], for: .normal)
//            toolButton.setBackgroundImage(UIImage(named: ToolsButton.getButtonsList()[i]), for: .normal)
            
            xCoord +=  Constants.ToolsButton.buttonWidth + Constants.ToolsButton.gapBetweenButtons
            self.toolsScrollView.addSubview(toolButton)
        }
        self.toolsScrollView.contentSize = CGSize(width: Constants.ToolsButton.buttonWidth * CGFloat(itemCount+3), height: 5)
    }
    
    @objc func sliderContrastValueChanged(sender: UISlider)
    {
        var sliderValue = sender.value
        Photo.getCurrentFilter().setValue(sliderValue, forKey: "inputContrast")
        let newImage = Photo.applyFilter(filter: Photo.getCurrentFilter())
        self.imageToFilter.image = newImage
    }
    
    @objc func sliderBrightnessValueChanged(sender: UISlider)
    {
        var sliderValue = sender.value
        Photo.getCurrentFilter().setValue(sliderValue, forKey: "inputBrightness")
        let newImage = Photo.applyFilter(filter: Photo.getCurrentFilter())
        self.imageToFilter.image = newImage
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.originalImage.image = Photo.getOriginalImage()
        self.imageToFilter.isHidden = true
        self.originalImage.isHidden = false
    }
    
    func reloadData() {
        print("data")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func goToMainAction() {
        Photo.setOriginalImage(originalImage: self.originalImage.image!)
        let nextViewController = Constants.storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
