//
//  ToolsButton.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 29.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import Foundation
import UIKit

class ToolsButton {
    let toolsButton = UIButton(type: .custom)
    var xCoord: CGFloat!
    var yCoord: CGFloat!
    
    init(xCoord: CGFloat, yCoord: CGFloat) {
        self.toolsButton.frame = CGRect(origin: CGPoint(x:xCoord, y:yCoord), size: CGSize(width: Constants.ToolsButton.buttonWidth, height: Constants.ToolsButton.buttonHeight))
        self.toolsButton.layer.cornerRadius = 6
        self.toolsButton.clipsToBounds = true
    }
    
    func getButton() -> UIButton {
        return self.toolsButton
    }
    
    static func getButtonsList() -> Array<String> {
        return [
            "crop",
            "contrast",
            "brighten",
        ]
    }
}
