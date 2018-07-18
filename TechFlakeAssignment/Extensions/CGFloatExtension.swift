//
//  CGFloat.swift
//  TechFlakeAssignment
//
//  Created by Jayesh on 18/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit
import AVFoundation

extension CGSize{
    
    // MARK:- get Height According Ratio
    func getHeightAccordingWidthRatio() -> CGFloat {
        let boundingRect = CGRect(
            x: 0,
            y: 0,
            width: self.width,
            height: CGFloat(MAXFLOAT)
        )
        let rect = AVMakeRect(
            aspectRatio: self,
            insideRect: boundingRect
        )
        return rect.size.height
    }
    
}
