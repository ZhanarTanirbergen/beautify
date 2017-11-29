//
//  Button.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 26.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import Foundation
import UIKit

class Button {
    let filterButton = UIButton(type: .custom)
    var xCoord: CGFloat = 5
    var yCoord: CGFloat = 5
    
    init(xCoord: CGFloat, yCoord: CGFloat) {
        self.filterButton.frame = CGRect(origin: CGPoint(x:xCoord, y:yCoord), size: CGSize(width: Constants.Button.buttonWidth, height: Constants.Button.buttonHeight))
        self.filterButton.layer.cornerRadius = 6
        self.filterButton.clipsToBounds = true
    }
    
    func getButton() -> UIButton {
        return self.filterButton
    }
}
