//
//  Slider.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 26.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import Foundation
import UIKit

class Slider {
    var mySlider: UISlider!
    
    init() {
        self.mySlider = UISlider(frame:CGRect(x: 30, y: 100, width: 300, height: 20))
        self.mySlider.minimumValue = 0
        self.mySlider.maximumValue = 1
        self.mySlider.value = 0
        self.mySlider.isContinuous = true
        self.mySlider.tintColor = UIColor.purple
        self.mySlider.tag = 1
//        mySlider.addTarget(self, action: #selector(self.amounSliderValueChanged(_:)), for: .valueChanged)
    }
    
    func getSlider() -> UISlider {
        return self.mySlider
    }
    
//    @IBAction func amounSliderValueChanged( _ sender: UISlider) {
//        print("Slider")
//        var sliderValue = sender.value
//        let currentFilter = Photo.getCurrentFilter()
//        currentFilter.setDefaults()
//        if currentFilter.name == "CIVignette" {
//            sliderValue = sliderValue * 100
//        }
//        currentFilter.setValue(sliderValue, forKey: kCIInputIntensityKey)
//        currentFilter.setValue(Photo.getCoreImage(), forKey: kCIInputImageKey)
//        let filteredImageData = currentFilter.value(forKey: kCIOutputImageKey) as! CIImage
//        let filteredImageRef = Photo.getContext().createCGImage(filteredImageData, from: filteredImageData.extent)
//        let newImage = UIImage(cgImage: filteredImageRef!)
//        Photo.setImageToFilter(imageToFilter: newImage)
//        
//    }
    
}
