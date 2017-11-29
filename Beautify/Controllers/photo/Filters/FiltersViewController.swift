//
//  MainViewController.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 21.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var originalImage: UIImageView!
    @IBOutlet weak var imageToFilter: UIImageView!
    @IBOutlet weak var filtersScrollView: UIScrollView!
    
    var CIFilterNames = Filter.getFilters()
    
    @objc func filterButtonTapped(sender: UIButton) {
        self.originalImage.isHidden = true
        let button = sender as UIButton
        self.imageToFilter.image = button.backgroundImage(for: UIControlState.normal)
        
        for subview in view.subviews {
            if (subview.tag == 1) {
                subview.removeFromSuperview()
            }
        }
        
        Photo.setCurrentFilter(currentFilter: CIFilter(name: "\(CIFilterNames[sender.tag])")!)
        let inputKeys = Photo.getCurrentFilter().inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            let mySlider = Slider.init().getSlider()
            mySlider.addTarget(self, action: #selector(self.amounSliderValueChanged(_:)), for: .valueChanged)
            self.view.addSubview(mySlider)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doneItem = UIBarButtonItem(title: "Apply", style: .plain, target: self, action: #selector(goToMainAction));
        navigationItem.rightBarButtonItem = doneItem
        self.originalImage.image = Photo.getOriginalImage()

        var xCoord: CGFloat = 5
        let yCoord: CGFloat = 5
        var itemCount = 0
        
        for i in 0..<CIFilterNames.count {
            itemCount = i
            // Button properties
            let filterButton = Button.init(xCoord: xCoord, yCoord: yCoord).getButton()
            filterButton.tag = itemCount
            filterButton.addTarget(self, action: #selector(self.filterButtonTapped(sender:)), for: .touchUpInside)
            // Create filters for each button
            let imageForButton = Photo.applyFilter(filter: CIFilter(name: "\(CIFilterNames[i])" )!)
            filterButton.setBackgroundImage(imageForButton, for: UIControlState.normal)
            
            xCoord +=  Constants.Button.buttonWidth + Constants.Button.gapBetweenButtons
            filtersScrollView.addSubview(filterButton)
        }
        
        filtersScrollView.contentSize = CGSize(width: Constants.Button.buttonWidth * CGFloat(itemCount+3), height: yCoord)
    }
 
    @IBAction func amounSliderValueChanged( _ sender: UISlider) {
        var sliderValue = sender.value
        let currentFilter = Photo.getCurrentFilter()
        
        if currentFilter.name == "CIVignette" {
            sliderValue = sliderValue * 100
        }
        
        currentFilter.setValue(sliderValue, forKey: kCIInputIntensityKey)
        let newImage = Photo.applyFilter(filter: currentFilter)
        self.imageToFilter.image = newImage
    }
    
    @IBAction func goToMainAction() {        
        Photo.setOriginalImage(originalImage: self.imageToFilter.image!)
        let nextViewController = Constants.storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    //    func logAllFilters() {
    //        let properties = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
    //        for filterName: String in properties {
    //                print(filterName)
    //        }
    //    }
}
