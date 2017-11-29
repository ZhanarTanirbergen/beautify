//
//  Filter.swift
//  Beautify
//
//  Created by Zhanara Tanirbergenova on 26.11.17.
//  Copyright © 2017 Zhanara Tanirbergenova. All rights reserved.
//

import Foundation

class Filter {
    static func getFilters() -> Array<String> {
        return [
            "CIPhotoEffectChrome",
            "CIBloom",
            "CIPhotoEffectInstant",
            "CIPhotoEffectNoir",
            "CIPhotoEffectTonal",
            "CIVignette",
            "CIPhotoEffectTransfer",
            "CIColorMonochrome",
            "CIEdges",
            "CIGloom",
            "CIPhotoEffectFade",
            "CIPhotoEffectProcess",
            "CISepiaTone",
            "CIUnsharpMask",
            "CIVignetteEffect",
            "CIComicEffect",
            "CIDiscBlur",
            "CIFalseColor",
            "CIOverlayBlendMode",
            "CIPixellate",
            "CISpotColor",
            "CIVortexDistortion",
            "CIXRay"
        ]
    }
}
