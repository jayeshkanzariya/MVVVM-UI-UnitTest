//
//  StringExtension.swift
//  TechFlakeAssignment
//
//  Created by Jayesh on 18/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

extension URL{
    
    func getSizeOfImage() -> CGSize?{
        if let imageSource = CGImageSourceCreateWithURL(self as CFURL, nil) {
            if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary? {
                let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as! CGFloat
                let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as! CGFloat
                return CGSize(width: pixelWidth, height: pixelHeight)
            }
        }
        return nil
    }
    
}


