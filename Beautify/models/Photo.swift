//
//  Photo.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 26.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import Foundation
import UIKit

class Photo {
    static var originalImage: UIImage!
    static var currentFilter: CIFilter!
    
    static func getOriginalImage() -> UIImage {
        return self.originalImage
    }
    
    static func setOriginalImage(originalImage: UIImage) {
        self.originalImage = originalImage
    }
    
    static func getCurrentFilter() -> CIFilter {
        return self.currentFilter
    }
    
    static func setCurrentFilter(currentFilter: CIFilter) {
        self.currentFilter = currentFilter
    }
    
    static func getContext() -> CIContext {
        return CIContext(options: nil)
    }
    
    static func getCoreImage() -> CIImage {
        return CIImage(image: self.originalImage)!
    }
    
    static func applyFilter(filter: CIFilter) -> UIImage {
        filter.setValue(self.getCoreImage(), forKey: kCIInputImageKey)
        let filteredImageData = filter.value(forKey: kCIOutputImageKey) as! CIImage
        let filteredImageRef = Photo.getContext().createCGImage(filteredImageData, from: filteredImageData.extent)
        
        return UIImage(cgImage: filteredImageRef!)
    }
}
